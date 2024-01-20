SELECT
      orderid AS order_id,
      amount
      
FROM `dbt-tutorial`.stripe.payment
WHERE status = 'success'