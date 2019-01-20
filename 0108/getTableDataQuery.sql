select t.column_name name, t.data_type type, t.data_precision length, cons.constraint_name const
					from user_tab_cols t join user_cons_columns cons
					 on ((t.table_name = cons.table_name(+)) and (t.column_name = cons.column_name(+)))
					where t.table_name = '?';

select table_name, column_name, data_type, data_precision from user_tab_cols WHERE table_name='DEPT';

select table_name, column_name, constraint_name from user_cons_columns where table_name ='DEPT';
