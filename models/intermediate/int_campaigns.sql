-- int_campaign_file

select
    date_date,
    paid_source,
    campaign_key,
    campgn_name as campaign_name,
    CAST(ads_cost AS FLOAT64) as ads_cost,
    impression,
    click
from {{ ref("stg_raw__bing") }}

union all

select
    date_date,
    paid_source,
    campaign_key,
    campgn_name as campaign_name,
    CAST(ads_cost AS FLOAT64) as ads_cost,
    impression,
    click
from {{ ref("stg_raw__adwords") }}

union all

select
    date_date,
    paid_source,
    campaign_key,
    campgn_name as campaign_name,
    CAST(ads_cost AS FLOAT64) as ads_cost,
    impression,
    click
from {{ ref("stg_raw__facebook") }}

union all

select
    date_date,
    paid_source,
    campaign_key,
    campgn_name as campaign_name,
    CAST(ads_cost AS FLOAT64) as ads_cost,
    impression,
    click
from {{ ref("stg_raw__criteo") }}
