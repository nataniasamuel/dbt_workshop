SELECT
    id as user_id,
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    country,
    created_at as signup_date
FROM `bigquery-public-data.thelook_ecommerce.users`