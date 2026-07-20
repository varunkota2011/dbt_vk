select
  size,
  {{ dbt_utils.pivot(
      'color',
      dbt_utils.get_column_values(ref('new_color'), 'color'),
      agg='sum',
      then_value='quantity'
  ) }}
from {{ ref('new_color') }}
group by size
