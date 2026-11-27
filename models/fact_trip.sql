with trips as (
    select 
        RIDE_ID ,
        RIDE_TYPE,
        date(to_timestamp(START_TIME)),
        START_STATION_ID,
        END_STATION_ID,
        MEMBER_CASUAL,
        timestampdiff(seconds, to_timestamp(START_TIME), to_timestamp(END_TIME)) as trip_duration_seconds
    from
        {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
)


select * from trips