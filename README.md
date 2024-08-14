# CMARKET-USER-SERVICE
Микросервис занятий в проекте CoursesMarketplace

## Используемые технологии:
- FastAPI
- SQLAlchemy 2
- Pytest
- MySQL + asyncmy

## Документация
Доступна после запуска проекта по роутам /docs или /redoc


## Установка
1. Установить Docker и запустить
2. Скачать файлы проекта на ПК
3. Для запуска в терминале директории проекта прописать команду:
```
docker compose up -d
```
4. Для выключения прописать команду:
```
docker stop $(docker ps -q)
```

## Использование
#### Располагается по адресам:
API: http://127.0.0.1:8000/ или http://localhost:8000/

> [!TIP]
> Для просмотра базы данных можно использовать phphmyadmin.

phpmyadmin: http://127.0.0.1:8080/ или http://localhost:8080/
  - пользователь: root
  - пароль: root