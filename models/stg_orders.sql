SELECT 
    order_id,
    user_id,
    status,
    created_at,
    returned_at
FROM `bigquery-public-data.thelook_ecommerce.orders`
LIMIT 1000
