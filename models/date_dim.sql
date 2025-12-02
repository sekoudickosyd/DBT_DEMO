with cte as (
    select 
        TO_TIMESTAMP(STARTED_AT) as started_at,
        DATE(TO_TIMESTAMP(STARTED_AT)) as date_started_at,
        MONTH(TO_TIMESTAMP(STARTED_AT)) as month_started_at,
        HOUR(TO_TIMESTAMP(STARTED_AT)) as hour_started_at,
        DAYNAME(TO_TIMESTAMP(STARTED_AT)) as dayname_started_at,
        case
            when DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sat', 'Sun') THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END as day_type,
        case 
            when MONTH(TO_TIMESTAMP(STARTED_AT)) in (12, 1, 2) THEN 'WINTER'
            when MONTH(TO_TIMESTAMP(STARTED_AT)) in (3, 4, 5) then 'SPRING'
            when MONTH(TO_TIMESTAMP(STARTED_AT)) in (6, 7, 8) then 'SUMMER'
            else 'AUTUMN'
        end as season

    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select *
from cte 
