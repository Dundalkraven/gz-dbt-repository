--finance_campaign_monthly


SELECT 
    FORMAT_DATE('%Y-%m', f.date_date) AS datemonth,
    SUM(f.operational_margin - c.ads_cost) AS ads_margin,
    AVG(f.average_basket) AS average_basket,
    SUM(f.operational_margin) AS operational_margin,
    SUM(c.ads_cost) AS ads_cost,
    SUM(c.ad_impressions) AS ads_impression,
    SUM(c.ad_clicks) AS ads_clicks,
    SUM(f.quantity) AS quantity,
    SUM(f.revenue) AS revenue,
    SUM(f.purchase_cost) AS purchase_cost,
    SUM(f.margin) AS margin,
    SUM(f.shipping_fee) AS shipping_fee,
    SUM(f.logcost) AS logcost,
    SUM(f.ship_cost) AS ship_cost

FROM 
    {{ ref('finance_days') }} AS f
JOIN 
    {{ ref('int_campaigns_day') }} AS c
ON 
    f.date_date = c.date_date

GROUP BY 
    FORMAT_DATE('%Y-%m', f.date_date)
ORDER BY 
    datemonth
