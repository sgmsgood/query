/* ���� 1.
�����縦 �ΰ� �Է¹޾� �����翡 �ش��ϴ� ��� ������
 ������, ������,�𵨸�,���,����,�ɼ��� ��ȸ �ϼ���.
 ����� ������ ������������ ��ȸ�Ͽ��� �� ��ȸ�� ����� 
   3~6��° ���ڵ常  ����ϼ���.

�ƹ���, �ҷ��並 �Է��Ͽ��� ��
 ��� ��
-----------------------------------------------------------------
��ȣ ������  ������  �𵨸�  ���  ����   �Է��� 
-----------------------------------------------------------------
1     ����     ����    �ƹ���  2001  3,500 mm-dd-yyyy


-----------------------------------------------------------------
�˻� ��� ���� [x]��, ��� [x]��

�ƹ��� x��� �ҷ��� x��� �˻� ����� ���� ����� ī��Ʈ �մϴ�.

*/

set serveroutput on
set verify off

accept maker1 prompt '������1: '
accept maker2 prompt '������2: '

declare
      
	type rec_car is record ( r number,
							country car_country.country%type,
							maker car_maker.maker%type,
							model car_maker.model%type,
							car_year car_model.car_year%type,
							price car_model.price%type,
							hiredate car_model.hiredate%type);
							
	type tab_car is table of rec_car index by binary_integer;
	
	arr_car tab_car;
	
	search_cnt_1 number := 0;
	search_cnt_2 number := 0;
	
	i number := 0;
		

begin  

	dbms_output.put_line('-------------------------------------------------------------');
	dbms_output.put_line('��ȣ   ������    ������    �𵨸�    ���    ����     �Է���'); 
	dbms_output.put_line('-------------------------------------------------------------');
	
	for temp in(
	
		select  r, country, maker, model, car_year, price, hiredate 
		from (
		select rownum r, country, maker, model, car_year, price, hiredate
				from (select 	cc.country, cma.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate 
			 			from    car_country cc, car_maker cma, car_model cmo
						where 	(cma.maker = cc.maker and cma.model = cmo.model) and (cma.maker='&maker1' or cma.maker ='&maker2')
	    				order by cmo.price) 
	   	where r between 3 and 6)
	   	
	   	) 
	   	
	loop 
	
	  i := i+1;
	  arr_car(i) := temp;
	 
	 if (arr_car(i) = '&maker1') then
	  	search_cnt_1 := serch_cnt_1+1;
	  	
	  elsif (arr_car(i) = '&maker2') then
	  	search_cnt_2 := serch_cnt_2+1; 
	  	
	  end if;
	
	  
	end loop; 
	
		for i in 1 .. arr_car.count loop
			dbms_output.put_line(i||arr_car(i).country||arr_car(i).maker||arr_car(i).model||arr_car(i).car_year
								  ||to_char(arr_car(i).price,'9,999')
								  ||to_char(arr_car(i).hiredate,'mm-dd-yyyy'));
		end loop;
		
 	dbms_output.put_line('�˻����:'||'&maker1'||search_cnt_1||']��, ���['||serch_cnt_2||']��');
	  
	  
	

end;
/