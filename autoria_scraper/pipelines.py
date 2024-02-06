# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
import logging

from scrapy.spiders import Spider
from sqlalchemy.orm import Session
from app.models import Car
from app.database import SessionLocal
from autoria_scraper.items import CarItem


class UsedCarsScraperPipeline:
    session: Session

    def open_spider(self, spider: Spider) -> None:
        """This method is called when the spider is opened."""
        self.session = SessionLocal()

    def close_spider(self, spider: Spider) -> None:
        """This method is called when the spider is closed."""
        self.session.close()

    def process_item(self, item: CarItem, spider: Spider) -> CarItem:
        """Process each item through this pipeline."""
        existing_car = self.session.query(Car).filter_by(url=item.url).first()
        logging.info(f"Existing car: {existing_car.title}")

        if existing_car:
            existing_car.title = item.title
            existing_car.price_usd = item.price_usd
            existing_car.odometer = item.odometer
            existing_car.username = item.username
            existing_car.phone_number = item.phone_number
            existing_car.image_url = item.image_url
            existing_car.images_count = item.images_count
            existing_car.car_number = item.car_number
            existing_car.car_vin = item.car_vin
            existing_car.datetime_found = item.datetime_found

        else:
            car = Car(
                url=item.url,
                title=item.title,
                price_usd=item.price_usd,
                odometer=item.odometer,
                username=item.username,
                phone_number=item.phone_number,
                image_url=item.image_url,
                images_count=item.images_count,
                car_number=item.car_number,
                car_vin=item.car_vin,
                datetime_found=item.datetime_found,
            )
            self.session.add(car)
            logging.info(f"Added new car: {item.title}")
        try:
            self.session.commit()
        except Exception as e:
            logging.error(f"Error in database operation for item {item.url}: {e}")
            self.session.rollback()
            raise

        return item
