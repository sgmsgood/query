CREATE OR REPLACE
  open cur_join for 
   		select ucon.constraint_name, ucl.data_type, ucm.column_name 
   		from user_tab_constraints ucon, user_tab_columns ucm, user_tab_cols ucl
   		where   ucon.table_name = ucl.table_name and ucl.data_type = ucm.data_type;
/