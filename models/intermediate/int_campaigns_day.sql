-- Aggregated campaigns daiy data

SELECT 
    date_date,
    CAST(SUM(ads_cost) AS FLOAT64) AS ads_cost,
    SUM(impression) AS ad_impressions,
    SUM(click) AS ad_clicks
FROM {{ref('int_campaigns')}}
 GROUP BY 
 date_date
order by date_date