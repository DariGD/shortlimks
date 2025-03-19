
FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*
    
WORKDIR /app


COPY requirements.txt .
COPY main.py /app/
COPY database.py /app/
COPY models.py /app/

RUN pip install --no-cache-dir -r requirements.txt


RUN apt-get update && apt-get install -y redis-server


EXPOSE 8000


CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
