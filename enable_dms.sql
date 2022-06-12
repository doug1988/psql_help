--Enable DMS:
create extension pglogical;

SELECT * FROM pg_create_logical_replication_slot('test_slot', 'pglogical');

select pglogical.create_node(
  node_name := 'provider',
  dsn := 'host= endpoint port=5432 user=postgres dbname=mydb password=mypass'
);

select pglogical.create_replication_set('test_slot', false, true, true, false);