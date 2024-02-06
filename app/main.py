from fastapi import FastAPI, HTTPException, Query, Depends
from sqlalchemy.orm import Session
import asyncio
from app import models, schemas, dependencies
from app.database import engine

app = FastAPI()

models.Base.metadata.create_all(bind=engine)

SPIDER_NAME = "used_cars"


@app.post("/start_spider/")
async def start_spider():
    try:
        command = f"scrapy crawl {SPIDER_NAME}"
        process = await asyncio.create_subprocess_shell(
            command,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE,
        )
        stdout, stderr = await process.communicate()
        if process.returncode == 0:
            return {"status": "success", "message": "Spider started successfully"}
        else:
            return {"status": "error", "message": stderr.decode().strip()}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/used_cars/", response_model=list[schemas.Car])
def list_cars(
    skip: int = Query(0, alias="skip"),
    limit: int = Query(10, alias="limit"),
    db: Session = Depends(dependencies.get_db),
) -> list[schemas.Car]:
    cars = db.query(models.Car).offset(skip).limit(limit).all()
    return cars
