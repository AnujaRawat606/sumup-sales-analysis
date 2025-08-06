CREATE OR REPLACE TABLE stg_opportunities AS
SELECT DISTINCT
   -- Identifiers
   LOWER(TRIM(id)) AS opportunity_id,
   LOWER(TRIM(account_id)) AS account_id,


   -- Timestamps
   CAST(created_date AS TIMESTAMP) AS opportunity_created_at,
   CAST(quote_created_date AS TIMESTAMP) AS quote_created_at,
   CAST(quote_signed_date AS TIMESTAMP) AS quote_signed_at,


   -- Metrics
   CAST(quote_mrr AS DECIMAL(10,2)) AS quote_mrr,


   -- Derived
   CASE
       WHEN quote_created_date IS NOT NULL AND created_date IS NOT NULL
       THEN DATEDIFF(DAY, created_date, quote_created_date)
       ELSE NULL
   END AS days_to_quote_created,


   CASE
       WHEN quote_signed_date IS NOT NULL AND created_date IS NOT NULL
       THEN DATEDIFF(DAY, created_date, quote_signed_date)
       ELSE NULL
   END AS days_to_quote_signed,


   CASE
       WHEN quote_signed_date IS NOT NULL THEN TRUE
       ELSE FALSE
   END AS is_signed


FROM opportunity
WHERE
   IS_DELETED IS NULL OR IS_DELETED = 0;
