#  shortlinks
Создание API-сервиса по сокращению ссылок
Этот сервис предоставляет API для сокращения ссылок с возможностью управления, аналитики и кастомных alias.
Основные эндпоинты ниже
![image](https://github.com/user-attachments/assets/ff56a1d4-2d8b-4dc9-b7fa-651b027fb394)


##  Развернутый сервис

Ссылка на развернутый сервис на Render https://shortlinks-9hbo.onrender.com/docs 

##  Функциональность API

Часть функций доступна только зарегестрированным пользователям, для этого необходимо пройти регистрацию с получением JWT-токена

Для этого сначала необходимои пройти регистрацию и далее авторизацию

![image](https://github.com/user-attachments/assets/ea24619c-09ef-4f66-8622-939524885ddc)

![image](https://github.com/user-attachments/assets/d3fafc84-978c-4ddb-a1b5-30dc379c8581)


1. Создание короткой ссылки url

![image](https://github.com/user-attachments/assets/9a1e9eb3-7417-4312-96f1-2769bc8f6a2f)

Пример ответа:

{
  "short_url": "http://127.0.0.1:8000/JrNNuZ"
}

2. Переход по сокращенной ссылке

![image](https://github.com/user-attachments/assets/f12122b8-8412-4195-8385-1b7277ab8385)


3. Получение статистики по ссылке

![image](https://github.com/user-attachments/assets/7f10afbd-8edb-47e8-b82f-872cdad62e24)

4. Изменение адреса короткой ссылки
![image](https://github.com/user-attachments/assets/70ba422e-a2e5-4f55-a9b7-d1ba6c6dfab1)


5. Удаление ссылки из базы и хэша

![image](https://github.com/user-attachments/assets/0f976fb6-d63b-4a21-9918-65e63bd77199)

   

# # 🛠️ Запуск проекта

1. Запуск локально
 
git clone 

cd 

pip install -r requirements.txt

uvicorn app.main:app --host 0.0.0.0 --port 8000

2. Запуск через Docker

docker-compose up --build

3. Запуск через ссылку на развернутый проект в Render (нюанс - для подклбчения к Redis был использован внешний сервис upstash)



# Структура БД

##  Таблица users

| id  | username | password_hash |
| --- | -------- | ------------- |
| 1   | user1    | <hash_value>  |
| 2   | user2    | <hash_value>  |

##  Таблица links

| id  | original_url      | short_code | expires_at        | click_count | created_at          | last_used          | user_id |
| --- | ----------------- | ---------- | ----------------- | ----------- | ------------------- | ------------------ | ------- |
| 1   |  | abc123     |        | 15          | 2025-03-01 10:00:00 | NULL               | 1       |
| 2   |    | def456     |       | 25          | 2025-03-02 12:00:00 | NULL               | 2       |
