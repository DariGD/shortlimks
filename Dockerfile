
FROM python:3.9-slim

# Установим необходимые пакеты
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

# Установим рабочую директорию
WORKDIR /app

# Копируем файл зависимостей
COPY requirements.txt .

# Установим зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код приложения
COPY main.py /app/
COPY database.py /app/
COPY models.py /app/

# Открываем порты
EXPOSE 8000

# Запускаем Redis сервер в фоне
RUN redis-server &

# Запускаем приложение через Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

