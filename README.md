# Used Cars Scraper

## Project Overview

The Used Cars Scraper for used car from AutoRia website is an application designed to scrape and store data about used
cars from the AutoRia
platform. It utilizes Scrapy for efficient data scraping and FastAPI for managing and accessing the scraped data. The
data is stored in a PostgreSQL database, and the application supports daily database backups.

## Installation

Follow these steps to install and run the Used Cars Scraper:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/olenaliuby/used-car-scrapping-autoria.git
   cd used-car-scrapping-autoria
   ```

2. **Environment Configuration**:
   Create a `.env` file in the root directory. Example content:
   ```plaintext
   POSTGRES_HOST=<your db hostname>
   POSTGRES_DB=<your db name>
   POSTGRES_USER=<your db username>
   POSTGRES_PASSWORD=<your db user password>
   BACKUP_TIME=12:00 # Time in 24-hour format
   ```

3. **Build and Run with Docker**:
   ```bash
   docker-compose up --build
   ```
   To stop the services:
   ```bash
   docker-compose down
   ```
   The application will be accessible at `localhost:8000`.

## API Endpoints

- **Start the Scraper**:
    - POST `/start_spider/`
        - Starts the scraper to collect data from AutoRia.

- **List Scraped Cars**:
    - GET `/used_cars/`
        - Returns a list of scraped cars. Supports pagination with `skip` and `limit` query parameters.
- **Swagger Documentation**:
    - Access the Swagger UI at `localhost:8000/docs` for interactive API documentation and testing.

## Key Features

- **Data Scraping**: Automated scraping of used car details from AutoRia.
- **Data Storage**: Efficient storage and management of scraped data in a PostgreSQL database.
- **API Access**: FastAPI application to access and manage the scraped data.
- **Daily Backups**: Automated daily backups of the database at a specified time.

## Key Technologies Used

- **Scrapy**: An open-source web crawling framework for Python, used for extracting the data from websites.
- **FastAPI**: A modern, fast (high-performance) web framework for building APIs with Python, based on standard Python
  type hints.
- **PostgreSQL**: A powerful, open-source object-relational database system.
- **Docker**: A set of platform-as-a-service products that use OS-level virtualization to deliver software in packages
  called containers.
- **Swagger**: Interface Description Language for describing RESTful APIs expressed using JSON.

## Maintainer

- Olena Liuby ([olena.liuby@gmail.com])
