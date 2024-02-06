from sqlalchemy import Column, Integer, String, Float
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Car(Base):
    __tablename__ = "used_cars"

    id = Column(Integer, primary_key=True)
    url = Column(String, nullable=False, unique=True)
    title = Column(String, nullable=False)
    price_usd = Column(Float, nullable=False)
    odometer = Column(Integer, nullable=False)
    username = Column(String, nullable=True)
    phone_number = Column(String, nullable=True)
    image_url = Column(String, nullable=False)
    images_count = Column(Integer, nullable=False)
    car_number = Column(String, nullable=True)
    car_vin = Column(String, nullable=True)
    datetime_found = Column(String, nullable=False)
