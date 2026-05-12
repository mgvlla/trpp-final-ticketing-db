INSERT INTO event_category (name, description) VALUES
('Концерт', 'Музыкальные мероприятия'),
('Театр', 'Театральные постановки'),
('Лекция', 'Образовательные мероприятия');

INSERT INTO organizer (name, inn, email, phone) VALUES
('ООО АртСцена', '770123456789', 'info@artscene.ru', '+7-999-111-22-33'),
('ИП Смирнов', '780987654321', 'smirnov@events.ru', '+7-999-222-33-44');

INSERT INTO venue (name, city, address, capacity) VALUES
('КЗ Центральный', 'Москва', 'ул. Тверская, д. 10', 1200),
('Дом культуры Север', 'Москва', 'Ленинградский пр-т, д. 18', 650);

INSERT INTO app_user (last_name, first_name, middle_name, email, phone) VALUES
('Иванова', 'Анна', 'Сергеевна', 'anna@example.com', '+7-900-100-10-10'),
('Петров', 'Дмитрий', 'Олегович', 'dmitry@example.com', '+7-900-200-20-20'),
('Соколова', 'Мария', 'Игоревна', 'maria@example.com', '+7-900-300-30-30');

INSERT INTO event (event_name, event_date, base_price, description, event_category_id, organizer_id, venue_id) VALUES
('Весенний джазовый вечер', '2026-06-15 19:00:00', 2500.00, 'Концерт джазовой музыки', 1, 1, 1),
('Современная драма', '2026-06-20 18:30:00', 1800.00, 'Постановка московского театра', 2, 2, 2),
('Лекция по управлению проектами', '2026-06-25 17:00:00', 1200.00, 'Открытая лекция для студентов', 3, 1, 2);

INSERT INTO ticket_status (name) VALUES
('Свободен'),
('Продан'),
('Забронирован');

INSERT INTO ticket (event_id, seat_label, sector, price, ticket_status_id) VALUES
(1, 'A1', 'Партер', 2500.00, 2),
(1, 'A2', 'Партер', 2500.00, 2),
(1, 'A3', 'Партер', 2500.00, 1),
(2, 'B1', 'Центр', 1800.00, 2),
(2, 'B2', 'Центр', 1800.00, 1),
(3, 'C1', 'Зал 1', 1200.00, 2),
(3, 'C2', 'Зал 1', 1200.00, 3);

INSERT INTO order_status (name) VALUES
('Создан'),
('Оплачен'),
('Отменен');

INSERT INTO customer_order (user_id, created_at, order_status_id) VALUES
(1, '2026-05-10 12:15:00', 2),
(2, '2026-05-10 14:40:00', 2),
(3, '2026-05-11 10:05:00', 1);

INSERT INTO order_item (order_id, ticket_id, sale_price) VALUES
(1, 1, 2500.00),
(1, 4, 1800.00),
(2, 2, 2500.00),
(2, 6, 1200.00);

INSERT INTO payment_method (name) VALUES
('Банковская карта'),
('СБП'),
('Наличные');

INSERT INTO payment (order_id, payment_date, payment_method_id, amount, status) VALUES
(1, '2026-05-10 12:20:00', 1, 4300.00, 'Успешно'),
(2, '2026-05-10 14:45:00', 2, 3700.00, 'Успешно');
