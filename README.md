# CMARKET-USER-SERVICE
Микросервис занятий в проекте CoursesMarketplace

## Используемые технологии:
- FastAPI
- SQLAlchemy 2
- Pytest
- MySQL + asyncmy
- Tilt
- Kafka

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

> [!TIP]
> Есть дополнительная опция запуска с использованием Tilt.
Для этого вместо 3 и 4 пункта необходимо установить Tilt и написать в терминале:
```
Tilt up
```
Для выключения
```
Tilt down
```

## Использование
#### Располагается по адресам:
> API

API: http://127.0.0.1:8000/ или http://localhost:8000/

> UI для Kafka

Kafka UI: http://127.0.0.1:8080/ или http://localhost:8080/

> [!TIP]
> Для просмотра базы данных можно использовать phphmyadmin.

phpmyadmin: http://127.0.0.1:8090/ или http://localhost:8090/
  - пользователь: root
  - пароль: root

## Как читать код
### Проект разделен на несколько частей:

    .
    ├──studyService                # Папка с проектом
    │  ├── app                     # Папка с основным функционалом
    │  │   ├── api                 # Обработка запросов
    │  │   ├── core                # Инициализация БД в проекте
    │  │   ├── crud                # Класс реализации CRUD функций для моделей
    │  │   ├── kafka               # Работа с Kafka
    │  │   ├── models              # Модели для БД
    │  │   ├── schemas             # Схемы для апи
    │  │   ├── main.py             # Инициализация проекта
    │  │   └── utils.py            # Хелпер функции
    │  ├── db                      # Инициализация БД для развертывания в докере тестовой БД
    │  └── tests                   # Тесты
    └── kui                        # Конфиг Kafka UI