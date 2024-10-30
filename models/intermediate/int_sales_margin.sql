SELECT
    s.products_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    ROUND(s.quantity * p.purchase_price, 2) AS purchase_cost,
    ROUND(s.revenue - (s.quantity * p.purchase_price), 2) AS margin,
    {{ margin_percent('s.revenue', 's.quantity * p.purchase_price') }} AS margin_percent
FROM 
    {{ ref("stg_gz_raw_data__raw_gz_sales") }} s
LEFT JOIN 
    {{ ref("stg_gz_raw_data__raw_gz_product") }} p
USING (products_id)
