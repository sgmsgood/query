--record�� ������������ ����� table

set serveroutput on
 
-- class4 �л����� ��ȣ, �̸�, ����Ŭ ������ ó���ϴ� PL/SQL
declare
	
	-- 1.���ڵ� ����
		type stu_record is record (num number,
								   name varchar2(10),
								   oracle_score number(3)); 	
	
	-- �л����� ������ ������ table ����
		type stu_table is table of stu_record
			index by binary_integer;
		
	-- table ����� �л����� ������ ó���� ���� ����
		class4_tab stu_table;
		total_score number;
      
begin 
	--table ������ �� �Ҵ�
	class4_tab(1).num:= 1;
	class4_tab(1).name :='������'; 
	class4_tab(1).oracle_score := 98;
	
	class4_tab(2).num:= 2;
	class4_tab(2).name := '�ذ���'; 
	class4_tab(2).oracle_score := 85;
	
	class4_tab(3).num:= 3;
	class4_tab(3).name := '���ǽ�'; 
	class4_tab(3).oracle_score := 77;
	
	class4_tab(4).num:= 4;
	class4_tab(4).name := '�ڿ���'; 
	class4_tab(4).oracle_score := 62;
	
	dbms_output.put_line('�����ο�: '||class4_tab.count);
	dbms_output.put_line('��ȣ   �̸�   ����Ŭ����');
	dbms_output.put_line('============================');
	
	total_score:=0;
		
	for i in 1 .. class4_tab.count loop
		dbms_output.put_line(class4_tab(i).num||'      '||
		class4_tab(i).name||'     '||class4_tab(i).oracle_score);
		 
		total_score := total_score+class4_tab(i).oracle_score;

	end loop;                                                   
	dbms_output.put_line('============================');
	dbms_output.put_line('����['||total_score||'], ���['||total_score/class4_tab.count||']');	
end;
/				                                               
