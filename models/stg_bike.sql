with bike as (

    select 

        BIKEID as RIDE_ID,
        START_TIME as started_at,
        STOP_TIME ended_at,
        START_STATION_NAME,
        START_STATION_ID as START_STATIO_ID,
        END_STATION_NAME,
        END_STATION_ID,
        START_STATION_LATITUDE as start_lat,
        START_STATION_LONGITUDE as start_lng,
        END_STATION_LATITUDE as end_lat,
        END_STATION_LONGITUDE as end_lng,
        USERTYPE as MEMBER_CSUAL

    from {{ source('demo', 'bike') }}

    where START_TIME != 'starttime'
)

select *
from bike 
    

