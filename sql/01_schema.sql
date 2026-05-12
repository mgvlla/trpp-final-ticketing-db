CREATE TABLE event_category (
    event_category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE organizer (
    organizer_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    inn VARCHAR(12) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE venue (
    venue_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    capacity INTEGER NOT NULL CHECK (capacity > 0)
);

CREATE TABLE app_user (
    user_id SERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE event (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    event_date TIMESTAMP NOT NULL,
    base_price NUMERIC(10, 2) NOT NULL CHECK (base_price >= 0),
    description TEXT,
    event_category_id INTEGER NOT NULL REFERENCES event_category(event_category_id),
    organizer_id INTEGER NOT NULL REFERENCES organizer(organizer_id),
    venue_id INTEGER NOT NULL REFERENCES venue(venue_id)
);

CREATE TABLE ticket_status (
    ticket_status_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE ticket (
    ticket_id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES event(event_id) ON DELETE CASCADE,
    seat_label VARCHAR(20) NOT NULL,
    sector VARCHAR(30) NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    ticket_status_id INTEGER NOT NULL REFERENCES ticket_status(ticket_status_id),
    UNIQUE (event_id, seat_label)
);

CREATE TABLE order_status (
    order_status_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE customer_order (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES app_user(user_id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    order_status_id INTEGER NOT NULL REFERENCES order_status(order_status_id)
);

CREATE TABLE order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES customer_order(order_id) ON DELETE CASCADE,
    ticket_id INTEGER NOT NULL REFERENCES ticket(ticket_id),
    sale_price NUMERIC(10, 2) NOT NULL CHECK (sale_price >= 0),
    UNIQUE (ticket_id)
);

CREATE TABLE payment_method (
    payment_method_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES customer_order(order_id) ON DELETE CASCADE,
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method_id INTEGER NOT NULL REFERENCES payment_method(payment_method_id),
    amount NUMERIC(10, 2) NOT NULL CHECK (amount >= 0),
    status VARCHAR(50) NOT NULL
);
