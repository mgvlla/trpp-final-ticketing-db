# Команды для запуска проекта на MacBook

## 1. Открыть папку проекта

```bash
cd "/Users/lolitamagomedova/Documents/New project/final_db_project"
```

## 2. Проверить, установлен ли Docker

```bash
docker --version
docker compose version
```

## 3. Запустить PostgreSQL в контейнере

```bash
docker compose up -d
```

## 4. Проверить, что контейнер работает

```bash
docker ps
```

## 5. Подключиться к базе данных

```bash
docker exec -it trpp_final_postgres psql -U postgres -d event_ticketing_db
```

## 6. Полезные SQL-команды внутри psql

```sql
\dt
SELECT * FROM event;
SELECT * FROM ticket;
SELECT * FROM customer_order;
```

## 7. Выполнить готовые запросы из файла

```bash
docker exec -i trpp_final_postgres psql -U postgres -d event_ticketing_db < sql/03_queries.sql
```

## 8. Остановить контейнер

```bash
docker compose down
```

## 9. Остановить контейнер и удалить том с данными

```bash
docker compose down -v
```

## 10. Запустить проект заново с чистой базой

```bash
docker compose down -v
docker compose up -d
```
