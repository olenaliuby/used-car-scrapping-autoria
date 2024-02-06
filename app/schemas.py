from pydantic import BaseModel


class CarBase(BaseModel):
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


class CarCreate(CarBase):
    pass


class Car(CarBase):
    id: int

    class Config:
        orm_mode = True
