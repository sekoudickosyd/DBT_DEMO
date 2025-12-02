with bike as (
    select distinct
        START_STATIO_ID as STATION_ID, 
        START_STATION_NAME as STATION_NAME,
        start_lat as STATION_LAT,
        start_lng as STATION_LNG
    from {{ ref('stg_bike') }}
)

select *
from bike 