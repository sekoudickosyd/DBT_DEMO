{% macro get_season(x) %}
    case 
        when MONTH(TO_TIMESTAMP({{x}})) in (12, 1, 2) THEN 'WINTER'
        when MONTH(TO_TIMESTAMP({{x}})) in (3, 4, 5) then 'SPRING'
        when MONTH(TO_TIMESTAMP({{x}})) in (6, 7, 8) then 'SUMMER'
        else 'AUTUMN'
    end

{% endmacro %}

{% macro get_day_type(x) %}
    case
        when DAYNAME(TO_TIMESTAMP({{x}})) in ('Sat', 'Sun') THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
    END

{% endmacro %}


