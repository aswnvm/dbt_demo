WITH daily_weather_init AS (
    SELECT 
        date(time) as daily_weather,
        humidity,
        pressure,
        temp,
        clouds, 
        weather
    FROM {{ source('demo', 'weather') }}
),
daily_weather_agg as (
    select
        daily_weather,
        weather,
        round(avg(humidity), 2) as avg_humidity,
        round(avg(pressure),2) as avg_pressure,
        round(avg(temp),2) as avg_temp
    from
        daily_weather_init
    group by daily_weather, weather
    qualify row_number() over (partition by daily_weather order by count(weather) desc ) = 1
)
SELECT *
FROM daily_weather_agg;