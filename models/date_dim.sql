with cte as (
    select 
        TO_TIMESTAMP(STARTED_AT) as started_at,
        DATE(TO_TIMESTAMP(STARTED_AT)) as date_started_at,
        MONTH(TO_TIMESTAMP(STARTED_AT)) as month_started_at,
        HOUR(TO_TIMESTAMP(STARTED_AT)) as hour_started_at,
        DAYNAME(TO_TIMESTAMP(STARTED_AT)) as dayname_started_at,

        {{ get_day_type('STARTED_AT') }} as day_type,

        {{ get_season('STARTED_AT') }} as season

    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select *
from cte 
