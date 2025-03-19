# shortlinks
Создание API-сервиса по сокращению ссылок
Этот сервис предоставляет API для сокращения ссылок с возможностью управления, аналитики и кастомных alias.

Развернутый сервис

Ссылка на развернутый сервис

Функциональность API

1. Создание короткой ссылки url

![image](https://github.com/user-attachments/assets/9a1e9eb3-7417-4312-96f1-2769bc8f6a2f)

Пример ответа:

{
  "short_url": "https://ВАШ_ДОМЕН.com/my-link"
}

2. Переход по сокращенной ссылке

GET /{short_code}

Пример: GET https://ВАШ_ДОМЕН.com/my-link

Ответ: 302 Redirect на https://example.com

3. Получение статистики по ссылке

GET /stats/{short_code}

Пример ответа:

{
  "short_code": "my-link",
  "original_url": "https://example.com",
  "click_count": 42,
  "created_at": "2025-03-19T12:00:00"
}

🛠️ Запуск проекта

1. Запуск локально (Python 3.10+)

git clone https://github.com/ВАШ_РЕПОЗИТОРИЙ.git
cd ВАШ_РЕПОЗИТОРИЙ
pip install -r requirements.txt
uvicorn app.main:app --host 0.0.0.0 --port 8000

2. Запуск через Docker

docker-compose up --build

🗄️ Структура БД

Таблица links:

Поле

Тип данных

Описание

id

SERIAL PRIMARY KEY

Уникальный идентификатор

original_url

TEXT

Оригинальная ссылка

short_code

TEXT UNIQUE

Сокращенный код

created_at

TIMESTAMP

Дата создания

click_count

INTEGER

Количество переходов

📖 Документация API

После запуска доступна по адресу:
[http://localhost:8000/docs](http://127.0.0.1:8000/docs)
