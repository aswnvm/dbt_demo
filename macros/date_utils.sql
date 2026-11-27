{% macro get_season(x) %}
    case
        when month({{x}}) in (12, 1, 2)
        then 'winter'
        when month({{x}}) in (3, 4, 5)
        then 'spring'
        when month({{x}}) in (6, 7, 8)
        then 'summer'
        else 'autumn'
    end
{% endmacro %}


{% macro get_day_type(arg) %}
    case
        when dayname({{arg}}) in ('Sat', 'Sun')
        then 'Weekend'
        else 'Business Day'
    end
{% endmacro %}