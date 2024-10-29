with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_product') }}

),

renamed as (

    select
        products_id,
        CAST(purchase_price AS FLOAT64) as purchase_price

    from source

)

select * from renamed
