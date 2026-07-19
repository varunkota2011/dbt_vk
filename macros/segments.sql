{% macro rename_segments(column_name) %}
    case
        when {{ column_name }} in ('BUILDING', 'HOUSEHOLD', ' FURNITURE')
        then 'HOMES_SEGMENT'
        else 'MACHINES_SEGMENT'
    end
{% endmacro %}