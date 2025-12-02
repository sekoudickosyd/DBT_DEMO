with trips as (
    select 
        ride_id,
        -- RIDEABLE_TYPE,
        DATE(TO_TIMESTAMP(STARTED_AT)) as trip_date,
        START_STATIO_ID as START_STATION_ID,
        END_STATION_ID,
        MEMBER_CSUAL as MEMBER_CASUAL,
        TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) as trip_duration_sec

    from {{ ref('stg_bike') }}
)

select *
from trips