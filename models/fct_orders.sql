WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

order_items AS (
    SELECT 
        order_id, 
        sale_price 
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
),

users AS (
    SELECT * FROM {{ ref('dim_users') }}
)

SELECT 
    orders.order_id,
    orders.user_id,
    users.gender,
    users.country,
    orders.status,
    SUM(order_items.sale_price) as total_revenue
FROM orders
LEFT JOIN order_items ON orders.order_id = order_items.order_id
LEFT JOIN users ON orders.user_id = users.user_id
GROUP BY 1, 2, 3, 4, 5