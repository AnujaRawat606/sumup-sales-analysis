CREATE OR REPLACE TABLE staging_leads AS
SELECT DISTINCT
   -- Identifiers
   LOWER(TRIM(id)) AS lead_id,
   LOWER(TRIM(converted_account_id)) AS converted_account_id,


   -- Metadata
   LOWER(TRIM(a_lead_associated_country_c)) AS country,
   LOWER(TRIM(a_lead_utm_source_c)) AS utm_source,


   -- Dates
   CAST(created_date AS TIMESTAMP) AS lead_created_at,
   CAST(a_lead_first_reach_out_date_c AS TIMESTAMP) AS first_reach_out_at,
   CAST(a_lead_first_meeting_creation_date_c AS TIMESTAMP) AS first_meeting_created_at,
   CAST(a_lead_first_meeting_date_c AS TIMESTAMP) AS first_meeting_scheduled_at,
   CAST(a_lead_last_meeting_date_c AS TIMESTAMP) AS last_meeting_scheduled_at,


   -- Derived
   CASE
       WHEN a_lead_first_reach_out_date_c IS NOT NULL AND created_date IS NOT NULL
       THEN DATEDIFF(DAY, created_date, a_lead_first_reach_out_date_c)
       ELSE NULL
   END AS days_to_first_reach_out,


   CASE
       WHEN a_lead_first_meeting_creation_date_c IS NOT NULL AND created_date IS NOT NULL
       THEN DATEDIFF(DAY, created_date, a_lead_first_meeting_creation_date_c)
       ELSE NULL
   END AS days_to_meeting_created,


   -- Flags
   CASE
       WHEN converted_account_id IS NOT NULL THEN TRUE
       ELSE FALSE
   END AS is_converted


FROM lead
WHERE
   IS_DELETED IS NULL OR IS_DELETED = FALSE;
