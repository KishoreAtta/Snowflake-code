{% macro compare_row_count(a_relation,b_relation,c_relation) %}

select '{{a_relation}}' as relation_name, count(*) from {{a_relation}}

union all

select '{{b_relation}}' as relation_name, count(*) from {{b_relation}}

union all

select '{{c_relation}}' as relation_name, count(*) from {{c_relation}}

{% endmacro %}