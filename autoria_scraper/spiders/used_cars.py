import re
import logging
import requests
import sys
from datetime import datetime
from typing import Generator

import scrapy
from scrapy.http import HtmlResponse

from autoria_scraper.items import CarItem

logging.basicConfig(
    level=logging.INFO,
    format="[%(levelname)8s]: %(message)s",
    handlers=[
        logging.FileHandler("used_car_spider.log"),
        logging.StreamHandler(sys.stdout),
    ],
)


class UsedCarSpider(scrapy.Spider):
    """Spider to scrape used cars from auto.ria.com."""

    name = "used_cars"
    allowed_domains = ["auto.ria.com"]
    start_urls = ["https://auto.ria.com/uk/car/used/"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def parse(
        self, response: HtmlResponse, **kwargs
    ) -> Generator[scrapy.Request, None, None]:
        total_pages_selector = "#pagination > nav > span:nth-child(8) > a::text"
        total_pages_text = response.css(total_pages_selector).get()
        try:
            total_pages = int(total_pages_text.replace(" ", ""))
        except (ValueError, TypeError, AttributeError):
            self.logger.error("Failed to parse total page number.")
            total_pages = 1

        for page_number in range(1, total_pages):
            next_page_url = f"https://auto.ria.com/uk/car/used/?page={page_number}"
            yield scrapy.Request(next_page_url, callback=self.parse_page)

    def parse_page(self, response: HtmlResponse):
        cars = response.css("#searchResults section.ticket-item div.content-bar")
        for car in cars:
            is_sold = car.css(".footer_ticket i.icon-sold-out").get() is not None
            if is_sold:
                continue

            car_detail_link = car.css("a.m-link-ticket::attr(href)").get()
            if car_detail_link:
                car_detail_url = response.urljoin(car_detail_link)
                yield scrapy.Request(car_detail_url, callback=self.parse_car_details)

    def parse_car_details(self, response: HtmlResponse) -> CarItem:
        """Parse the car details page and return a CarItem."""
        logging.info(f"Parsing car details page: {response.url}")

        return CarItem(
            url=response.url,
            title=response.css("h1.head::text").get(),
            price_usd=int(
                response.css("div.price_value strong::text")
                .re_first(r"(\d+\s*\d+)")
                .replace(" ", "")
            ),
            odometer=self.get_odonometer(response),
            username=self.get_user_name(response),
            phone_number=self.get_phone_numbers(response),
            image_url=response.css(
                "#photosBlock div.photo-620x465 picture img::attr(src)"
            ).get(),
            images_count=self.get_images_count(response),
            car_number=self.get_car_number(response),
            car_vin=self.get_car_vin(response),
            datetime_found=datetime.now().isoformat(),
        )

    @staticmethod
    def get_user_name(response: HtmlResponse) -> str | None:
        """Get the username of the seller from the page."""
        selectors = [
            "#userInfoBlock div.seller_info div.seller_info_name a::text",
            "#userInfoBlock div.seller_info.mb-15 div h4 a::text",
            "#userInfoBlock div.seller_info_area div h4 a::text",
            "#userInfoBlock div.seller_info div.seller_info_name::text",
        ]

        for selector in selectors:
            user_name = response.css(selector).get()
            if user_name:
                return user_name.strip()

        return None

    @staticmethod
    def get_odonometer(response: HtmlResponse) -> int:
        """Get the odometer reading from the page."""
        odometer = response.css("div.base-information span.size18::text").re_first(
            r"(\d+)"
        )
        if odometer:
            return int(odometer) * 1000
        return 0

    @staticmethod
    def get_phone_numbers(response: scrapy.http.HtmlResponse) -> str | None:
        """Get phone numbers from the page using the data-hash and data-expires attributes for json request."""
        script_tag = response.css('[class^="js-user-secure"]')

        data_hash = script_tag.xpath("@data-hash").extract_first()
        data_expires = script_tag.xpath("@data-expires").extract_first()

        data_auto_id = response.css("body::attr(data-auto-id)").extract_first()

        if data_hash and data_expires:
            phone_number_url = f"https://auto.ria.com/users/phones/{data_auto_id}/?hash={data_hash}&expires={data_expires}"

            try:
                response = requests.get(phone_number_url)
                response.raise_for_status()
                phone_data = response.json()

                phone_numbers = [
                    phone["phoneFormatted"] for phone in phone_data.get("phones", [])
                ]
                return (
                    ", ".join(phone_numbers)
                    if phone_numbers
                    else "No phone number found"
                )
            except Exception as e:
                logging.error(f"Error making or processing the request: {e}")
                return "Error fetching phone numbers"

        return None

    @staticmethod
    def get_images_count(response: HtmlResponse) -> int:
        """Get the number of images of the car from the page."""

        images_count_text = response.css(
            "#photosBlock .preview-gallery.mhide .action_disp_all_block a.show-all::text"
        ).get()
        if images_count_text is None:
            images_count_text = response.css(
                "#photosBlock div.gallery-order.carousel div.count-photo.left span span.dhide::text"
            ).get()

        match = re.search(r"\d+", images_count_text)
        if match:
            return int(match.group())

        return 0

    @staticmethod
    def get_car_number(response: HtmlResponse) -> str | None:
        """Get the car number from the page."""
        car_number = response.css(
            "div.auto-wrap > main > div.m-padding > div.vin-checked.mb-15.full div.t-check > span.state-num::text"
        ).get()

        if car_number:
            return car_number.strip()

        return None

    @staticmethod
    def get_car_vin(response: HtmlResponse) -> str | None:
        """Get the car VIN from the page."""
        vin_number = response.css(
            "div.auto-wrap > main > div.m-padding > div.vin-checked.mb-15.full  div.t-check > span.label-vin::text"
        ).get()

        if vin_number:
            return vin_number.strip()

        return None
