{{
    config(alias='d_site', materialized='table', enabled=false)
}}

WITH
    final AS (
        SELECT 1 AS site_id, 'FRA' AS site_trigram, DATE('2023-01-01') AS open_date
        UNION ALL
        SELECT 2 AS site_id, 'France' AS site_trigram, DATE('2023-01-01') AS open_date
        UNION ALL
        SELECT NULL AS site_id, 'Belgium' AS site_trigram, DATE('2023-01-01') AS open_date
    )
SELECT
    *,
    {{ dbt_assertions.assertions() | indent(4) }},
FROM `final`
