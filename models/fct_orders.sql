WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

order_items AS (
    SELECT 
        order_id, 
        sale_price 
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
)

SELECT 
    orders.order_id,
    orders.user_id,
    orders.status,
    SUM(order_items.sale_price) as total_revenue
FROM orders
LEFT JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY 1, 2, 3