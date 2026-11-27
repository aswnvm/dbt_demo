with cte as 
    (select 
        start_time,
        to_timestamp(start_time) 
    from 
        {{ source("demo", "bike") }}
    where start_time != 'started_at') 
        
select * from cte
