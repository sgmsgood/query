/* ����
  -- ���� ���� �Է¹޾� ���̺��� car_model���̺��� ���, ����, �ɼ�, �Է����� ��ȸ�ϼ���.
  -- ���: xxxx�� �˻� ���
  		--------------------------------------------
  		���		����		�Է���			�ɼ�
  		--------------------------------------------
  		2010	1,990  ��-��-�� �б�	ó�� ,������ ��ȸ
  		--------------------------------------------
  		�˻� ��� [x]��
  		
  		���� 2�ڸ��� ��ȸ,s
  		������ �������� �����Ͽ� ��ȸ
  		(Ŀ��, ���ڵ�, ���̺��� ��� ����Ͽ� ����մϴ�.)
 */	
 

set serveroutput on
set verify off

accept model prompt '���� �Է��ϼ���: '

declare
  	cursor cur_carmodel is
			select  model, car_year, to_char(price,'9,999'), to_char(hiredate,'yy-mm-dd q') hiredate, substr(car_option,1,instr(car_option,','))
			from 	car_model
			where	model='&model'
			order by price; 

	type rec_carmodel is record (
							model car_model.model%type,
							car_year car_model.car_year%type,
							price varchar2(9),
							hiredate varchar2(20),
							car_option car_model.car_option%type
							);
	type tab_carmodel is table of rec_carmodel index by binary_integer; 
	
	carmodel_data rec_carmodel;                  
    arr_carmodel tab_carmodel;
    
    i number :=0; --�ʱ�ȭ
    
begin

	if cur_carmodel%isopen then -- car_model Ŀ���� �����ִ°�
	   close cur_carmodel;      -- �����ִٸ� Ŀ���� �ݾ�  (Ŀ���� 2�� ���� �� ���� ������ �̸� �ݾ���)
	end if;

     open cur_carmodel;    -- carmodelĿ���� �����ְ� 
     
     loop
	   fetch cur_carmodel into carmodel_data; -- carmodel_data���� carmodelĿ���� �ҷ��� (�����͸� ������ ���� �κ�)

	   exit when cur_carmodel%notfound; -- carmodel���� Ŀ������ ������� ������ ����
-- 		������ ó�� 	   
--		exit when not cur_emp%found;
		i := i+1;								
		arr_carmodel(i) := carmodel_data; -->>?
		 		
	end loop; 

    if i != 0 then
	dbms_output.put_line('���    ����   �Է���   �ɼ�');
	for idx in 1.. arr_carmodel.count loop
		dbms_output.put_line  --�����͸� ����ϴ� �κ�
				(arr_carmodel(idx).model||'   '||arr_carmodel(idx).price||'   '||arr_carmodel(idx).hiredate||'   '||arr_carmodel(idx).car_option); 
    end loop;    
    
    dbms_output.put_line('�˻� ��� ['||cur_carmodel%rowcount||' ] ��');
		
		else  
			dbms_output.put_line('&model'||'�� ���� ���� �����ϴ�.');
			
		end if;
			dbms_output.put_line('������ּż� ���翩');
		
		close cur_carmodel;
    
end;
/
  				