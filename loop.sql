do $$
	declare v_max integer := 1;
	declare	v_id  integer := 1;
	declare	v_core varchar(200);
	declare v_v4 integer := null;
    declare v_tenant int := null;
	
		begin
		while v_id <= v_max loop
			select col1, col2 , col3
			into v_core , v_v4 , v_tenant
		    from table 
		    where id = v_id;
		   
		    update table 
		    set corebusiness = col1
		    where col2 = v_v4 and col3 = v_tenant;
			
			raise notice 'Out addition count %', v_v4;
			v_id := v_id + 1;
	
	end loop;
end$$;