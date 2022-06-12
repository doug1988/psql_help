
-- Check if there is any lock on DB
select pid, 
       usename, 
       pg_blocking_pids(pid) as blocked_by, 
       query as blocked_query
from 
	pg_stat_activity
where 
	cardinality(pg_blocking_pids(pid)) > 0;

--check active transactions 
select * from   pg_stat_activity  where  state = 'active' ;

-- kill process
SELECT pg_terminate_backend(pid);