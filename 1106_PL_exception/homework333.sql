--����1.
--�����縦 �ΰ� �Է¹޾� �����翡 �ش��ϴ� ��� ������
-- ������, ������,�𵨸�,���,����,�ɼ��� ��ȸ �ϼ���.
-- ����� ������ ������������ ��ȸ�Ͽ��� �� ��ȸ�� ����� 
--   3~6��° ���ڵ常  ����ϼ���.
--
--���� ��Ƹ� �Է��Ͽ��� ��
-- ��� ��
-------------------------------------------------------------------
--��ȣ ������  ������  �𵨸�  ���  ����   �Է��� 
-------------------------------------------------------------------
--1     ����     ����    �ƹ���  2001  3,500 mm-dd-yyyy
-------------------------------------------------------------------
--�˻� ��� �ƹ��� [x]��, �ҷ��� [x]��
--
--�ƹ��� x��� �ҷ��� x��� �˻� ����� ���� ����� ī��Ʈ �մϴ�.
set serveroutput on
set verify off


  accept maker prompt'������  : '
declare

    type rec_car is record(country car_country.country%type,
    					   maker car_country.maker%type,
    					   model car_model.model%type,
    					   car_year car_model.car_year%type, 
    					   price car_model.price%type,
    					   hiredate car_model.hiredate%type
    					   );
    					   

	--����� record ������������ table ����
    type tab_car is table of rec_car index by binary_integer;
    --����� table�� table ����
    arr_car tab_car;
	cnt_h number:=0;
	cnt_k number:=0;
	i number :=0;
	j number :=0;
begin 
--��ȣ ������  ������  �𵨸�  ���  ����   �Է��� 
 dbms_output.put_line('------------------------------------------------------');
 dbms_output.put_line('��ȣ  ������ ������    �𵨸�   ���     ����     �Է���');
 dbms_output.put_line('------------------------------------------------------');
 
 	for temp in ( 
       select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate
       from  car_country cc, car_maker cma, car_model cmo
       where (cma.maker=cc.maker and cma.model=cmo.model) and cma.maker='&maker'
       order by cmo.price   
    )
     loop
	 i:=i+1;
	 arr_car(i):=temp;

	 end loop;

	 -- ������ �����͸� ��� �Ͽ� ��� ������ ����� ����Ѥ�.
	 for j in 1.. arr_car.count loop
	 --3~6 ���
         if j between 3 and 6 then
		  	 	dbms_output.put_line(j||'    '||arr_car(j).country||'   '||arr_car(j).maker||'      '||
		   						arr_car(j).model||'   '||
		   						arr_car(j).car_year||'   '||to_char(arr_car(j).price,'9999')||'   '||
		   						to_char(arr_car(j).hiredate,'mm-dd-yyyy'));
		   						-- ������ ��� ī��Ʈ
 		   							
		   		if '&maker'='����' then
		   		   cnt_h:=cnt_h+1;
		   		else
		   			cnt_k:=cnt_k+1;
				end if;
			
		   	 
		    end if;  
		   	
 		 

	end loop;     
     dbms_output.put_line('------------------------------------------------------');
     dbms_output.put_line('���� :  '||cnt_h||'    ��ƴ�: '||cnt_k);
     
     
 end;
 /
