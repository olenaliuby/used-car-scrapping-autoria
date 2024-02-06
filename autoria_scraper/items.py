# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy  # Define here the models for your scraped items

#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

from dataclasses import dataclass


@dataclass
class CarItem:
    url: str
    title: str
    price_usd: float
    odometer: int
    username: str | None
    phone_number: str | None
    image_url: str
    images_count: int
    car_number: str | None
    car_vin: str | None
    datetime_found: str
