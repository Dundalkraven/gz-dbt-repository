-- view to compute ads_margin along with other required columns

CREATE VIEW `myprojects-440010.dbt_rachid_finance.campaign_finance` AS

SELECT 
    f.date_date AS date,
    (f.operational_margin - c.ads_cost) AS ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.ad_impressions AS ads_impression,  
    c.ad_clicks AS ads_clicks,           
    f.quantity,
    f.revenue,
    f.purchase_cost,
    f.margin,
    f.shipping_fee,
    f.logcost,
    f.ship_cost
FROM 
    {{ ref('finance_days') }} AS f
JOIN 
    {{ ref('int_campaigns_day') }} AS c
ON 
    f.date_date = c.date_date
