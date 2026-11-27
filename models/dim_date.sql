with cte as 
    (select 
        to_timestamp(start_time) as started_at,
        date(started_at) as date_started_at,
        hour(started_at) as hour_started_at,
        {{get_day_type('started_at')}} as day_type,
        {{get_season('started_at')}} as station_of_year
    from 
        {{ source("demo", "bike") }}
    where start_time != 'started_at'
    limit 10) 
        
select * from cte
