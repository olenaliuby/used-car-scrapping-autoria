from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base, sessionmaker
from app.settings import settings

DATABASE_URL = settings.DATABASE_URL

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
