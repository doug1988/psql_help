select
  u.view_schema schema_name,
  u.view_name,
  u.table_schema referenced_table_schema,
  u.table_name referenced_table_name,
  v.view_definition
from information_schema.view_table_usage u
join information_schema.views v on u.view_schema = v.table_schema
  and u.view_name = v.table_name
where 
 u.view_schema = 'schema_name'
order by 
	u.view_schema, u.view_name;