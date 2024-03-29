WITH source AS (
    SELECT *
    FROM {{ source("stripe","payment")}}
),

staged AS (

    SELECT
        id as payment_id,
      orderid as order_id,
      paymentmethod as payment_method,
      status,
      -- amount is stored in cents, convert it to dollars
      amount / 100 as amount,
      created as created_at
    FROM source

)

SELECT *
FROM staged
