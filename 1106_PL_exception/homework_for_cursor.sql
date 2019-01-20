/* ����
  -- ���� ���� �Է¹޾� ���̺��� car_model���̺��� ������, ������, ���, ����, �ɼ�, �Է����� ��ȸ�ϼ���.
  -- ���: xxxx�� �˻� ���
  		--------------------------------------------
  		���		����		�Է���			�ɼ�
  		--------------------------------------------
  		2010	1,990  ��-��-�� �б�	ó�� ,������ ��ȸ
  		--------------------------------------------
  		�˻� ��� [x]��
  		
  		���� 2�ڸ��� ��ȸ,
  		������ �������� �����Ͽ� ��ȸ
  		(Ŀ��, ���ڵ�, ���̺��� ��� ����Ͽ� ����մϴ�.)
 */	
 

set serveroutput on
set verify off

accept model prompt '���� �𵨸�: '

declare
	-- ��ȸ�� ���� �����ϰ� ����ϱ� ���� record type ����
	type rec_car is record(country car_country.country%type,
							maker car_country.maker%type ,
							car_year car_model.car_year%type ,
							price car_model.price%type,
							car_option car_model.car_option%type,
							hiredate car_model.hiredate%type); 
							
	-- ����� record�� �������� ó���� ������ table ����
	type tab_car is table of rec_car index by binary_integer;
	
	-- ����� table�� table ���� ������ �ݵ�� �ؾ���!
	arr_car tab_car;
	
	-- ó��, ������ ����ϱ� ���� �ɼ��� �����ϴ� ����
	car_option car_model.car_option%type;
	-- ��ü �˻� ������ �����ϱ� ���� ����
	search_cnt number :=0;
	-- �ε����� �����ϱ� ���� ����
	i number := 0;
	 
begin 
	dbms_output.put_line('---------------------------------------------');
    dbms_output.put_line('������    ������    ���   ����   �Է���       �ɼ�');
    dbms_output.put_line('---------------------------------------------');
    
    -- �˻��� ����� table�� ���� (�ڵ�и�)-����� ������ ����
    for temp in 
      (
       select  cc.country, cc.maker, cmo.car_year, cmo.price, cmo.car_option, cmo.hiredate
       from    car_country cc, car_maker cma, car_model cmo 
       where   (cma.maker=cc.maker and cmo.model=cma.model) and cmo.model='&model' 
       order by cmo.price
      )
    
    loop 
      
    	i := i+1;
    	arr_car(i) := temp;
    	
    
    end loop;         
    
       search_cnt := i;
    
    -- ������ �����͸� ����Ͽ� ��� ������ ����� ����Ѵ�.
    for i in 1 .. arr_car.count loop
    	car_option := arr_car(i).car_option;
    	
    	if instr(car_option,',') > 0 then
    	car_option := substr(car_option, 1, instr(car_option,',')-1);
    	end if;
    	    	
    	car_option := substr(car_option,1,instr(car_option,',')-1);
    	 
    	dbms_output.put_line(arr_car(i).country||' '||arr_car(i).maker||' '||to_char(arr_car(i).car_year,'mm-dd-yy q')||' '||
    							to_char(arr_car(i).price,'9,999')||' '||arr_car(i).hiredate||' '||
    							car_option);
    end loop;
        dbms_output.put_line('------------------------------------------');
        dbms_output.put_line('�˻� ��� ['||search_cnt||']��');
end;
/
