SELECT
    e.event_id,
    e.event_name,
    e.event_date,
    v.name AS venue_name,
    o.name AS organizer_name
FROM event e
JOIN venue v ON v.venue_id = e.venue_id
JOIN organizer o ON o.organizer_id = e.organizer_id
ORDER BY e.event_date;

SELECT
    e.event_name,
    COUNT(t.ticket_id) AS sold_tickets
FROM event e
LEFT JOIN ticket t
    ON t.event_id = e.event_id
   AND t.ticket_status_id = (
       SELECT ticket_status_id
       FROM ticket_status
       WHERE name = 'Продан'
   )
GROUP BY e.event_name
ORDER BY sold_tickets DESC, e.event_name;

SELECT
    co.order_id,
    au.last_name || ' ' || au.first_name AS customer_name,
    SUM(oi.sale_price) AS order_total
FROM customer_order co
JOIN app_user au ON au.user_id = co.user_id
JOIN order_item oi ON oi.order_id = co.order_id
WHERE co.order_status_id = (
    SELECT order_status_id
    FROM order_status
    WHERE name = 'Оплачен'
)
GROUP BY co.order_id, customer_name
ORDER BY co.order_id;

SELECT
    e.event_name,
    t.seat_label,
    t.sector,
    t.price
FROM ticket t
JOIN event e ON e.event_id = t.event_id
WHERE t.ticket_status_id = (
    SELECT ticket_status_id
    FROM ticket_status
    WHERE name = 'Свободен'
)
ORDER BY e.event_name, t.seat_label;

SELECT
    e.event_name,
    COALESCE(SUM(oi.sale_price), 0) AS revenue
FROM event e
LEFT JOIN ticket t ON t.event_id = e.event_id
LEFT JOIN order_item oi ON oi.ticket_id = t.ticket_id
GROUP BY e.event_name
ORDER BY revenue DESC, e.event_name;
