create or replace procedure test_cons_cols_culm
		(cons varchar2,
		 cul varchar2,
		 data varchar2,
		 cur_join out sys_refcursor);

is 
	temp_cons varchar2(100) := constraint_type;

begin       
	open cur_cons for 
		select user_tab_constraints
		from user_constraints;      

    
   close cur_cons;
   	
end;
/
