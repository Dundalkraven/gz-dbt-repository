{{ 
  config(
    materialized='table'  
  ) 
}}

WITH sales AS (
    SELECT 
        s.orders_id,
        s.pdt_id AS product_id,  -- Updated to use pdt_id
        s.revenue,
        s.quantity,
        p.purchSE_PRICE AS purchase_price,  -- Updated to use purchSE_PRICE
        (s.quantity * CAST(p.purchSE_PRICE AS FLOAT64)) AS purchase_cost,  -- Calculate purchase cost
        (s.revenue - (s.quantity * CAST(p.purchSE_PRICE AS FLOAT64))) AS margin  -- Calculate margin
    FROM 
        {{ source('raw', 'sale') }} AS s  -- Use the source function for sales
    JOIN 
        {{ source('raw', 'product') }} AS p  -- Use the source function for product
    ON 
        s.pdt_id = p.products_id  -- Join on product_id
)

SELECT 
    orders_id,
    product_id,
    revenue,
    quantity,
    purchase_price,
    purchase_cost,
    margin  -- Include margin in the final output
FROM 
    sales
