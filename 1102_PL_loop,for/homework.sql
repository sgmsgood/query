/*
���� .

1.  class4 �������� �л����� �������� ���ϴ�  PL/SQL�� ����
   �ϰ����Ѵ�.  ���߱������ ����� �Ʒ��� ������ 
   [���� : 1200��,  ����ö :1250��] , 10Ű�θ� �ʰ��ϸ� ��4Ű�θ���
  100���� ��� �� �ΰ��ȴ�.  
  �� ������ �̿��Ͽ� �Ʒ� �л����� �����͸� ó���ϼ���
  ������. 
 1, ������, ����� ������ ���ﵿ, 5Ű��, ����
  2, ����ö, ��õ�� ������ ������, 20Ű��, ����ö
  3, ������, ��õ�� ���� ����, 16Ű��, ����ö
  4, �ڿ���, ����� ���Ǳ� ��õ��, 10Ű��, ����ö
  5, ���ü�, ����� ���빮�� ���빮��, 8Ű��, ����


   ���
   ��ȣ, �̸�,  �ּ�, �Ÿ�, �������, ���  */
    
-------

set serveroutput on

declare 

	-- 1. ���ڵ带 �����մϴ�.
	type tf_record is record (num number,
						name varchar2(9),
						loc varchar2(90),
						dist varchar2(60),
						trf	varchar2(9)
						); 
	
	--2. ���̺��� �����մϴ�.
	type tf_tab is table of tf_record index by binary_integer;
	
	--3. ������ �����մϴ�.
	tf_info tf_tab;
	
	b_cost number ;
    t_cost number ;
	
begin
 	
 	tf_info(1).num := 1;
 	tf_info(1).name := '������';
 	tf_info(1).loc := '����� ������ ���ﵿ';
 	tf_info(1).dist := '5';
 	tf_info(1).trf := '����';
 	
 	tf_info(2).num := 2;
    tf_info(2).name := '����ö' ;
    tf_info(2).loc := '��õ�� ������ ������'   ;
    tf_info(2).dist := '20';
    tf_info(2).trf := '����ö';
    
    	tf_info(3).num := 3 ;
    tf_info(3).name := '������';
    tf_info(3).loc :=  '��õ�� ���� ����';
    tf_info(3).dist :='16';
    tf_info(3).trf :='����ö';

	tf_info(4).num := 4  ;   
    tf_info(4).name := '�ڿ���';
    tf_info(4).loc := '����� ���Ǳ� ��õ��' ;
    tf_info(4).dist :=  '10';
    tf_info(4).trf :='����ö';
                                   
	tf_info(5).num := 5;
    tf_info(5).name := '���ü�';
    tf_info(5).loc := '����� ���빮�� ���빮��';
    tf_info(5).dist :='8'  ;
    tf_info(5).trf := '����'; 

    dbms_output.put_line('��ȣ  �̸�       �ּ�                       �Ÿ�   �������  �⺻���   ���    ');
    dbms_output.put_line('==========================================================================');
    
    
    t_cost := 0;
	b_cost := 0;
	
    for i in 1 .. tf_info.count loop
    
   
    					 
 	if substr(tf_info(i).dist) >10 then 
 			if(tf_info(i).trf = '����ö') then
				t_cost := 1250 + (trunc((tf_info(i).dist-10)/4, 0) * 100);
				b_cost := 1250;
			else
				t_cost := 1200 + (trunc((tf_info(i).dist-10)/4, 0) * 100);
				b_cost := 1200;
			end if;
	else
			if(tf_info(i).trf = '����ö') then
				b_cost := 1250;
				t_cost := b_cost;
			else
				b_cost := 1200;
				t_cost := b_cost;
			end if;
 		
 		
 	end if

    end loop;


end;
/
------------------------------------------     

/*
���� 2.   
  �л����� ������ ó���ϴ� PL/SQL�ۼ�.
   ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,��� �� ������ ���ִ� record��
  ����� �Ʒ��� �����͸� �Է��� �� 
  �ݺ����� ����Ͽ�  ����,����� ó���ϴ� PL/SQL �ۼ�   
 1, ������, 80,81
  2, ����ö, 94,80
  3, ������, 97,96
  4, �ڿ���, 86,92
  5, ���ü�, 76,99

 ��� 
   ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,��� 
  .
  .
  .
  �ڹ��ְ����� [xx] ����Ŭ �ְ����� [xxx] 
 */
 
 set serveroutput on
 
 declare
 
 	type c_score is record (num number,
						name varchar2(60),
						oracle_score number,
						java_score number);
						
	type st_score is table of c_score index by binary_integer;
						
	
	st st_score; 	
	total_score number; 
	top_oracle number;
	top_java number; 

begin

   st(1).num := 1;
    st(1).name := '������';
    st(1).oracle_score := 80;
    st(1).java_score := 81; 
   
   st(2).num := 2;
   st(2).name := '����ö';
   st(2).oracle_score := 94;
   st(2).java_score := 80; 
   
   st(3).num := 3;
   st(3).name := '������';
   st(3).oracle_score := 97;
   st(3).java_score := 96;
   
   st(4).num := 4;
   st(4).name := '�ڿ���';
   st(4).oracle_score := 86;
   st(4).java_score := 92; 
   
   st(5).num := 5;
   st(5).name := '���ü�';
   st(5).oracle_score := 76;
   st(5).java_score := 99; 
   
   
   
    dbms_output.put_line('��ȣ   �̸�   ����Ŭ����  ����  ���');
	dbms_output.put_line('===============================');  
	
	total_score := 0;
	
	top_oracle :=st(1).oracle_score;
	top_java := st(1).java_score;

	for i in 1 .. st.count loop
	  total_score := total_score + st(i).java_score + st(i).oracle_score;
	 
	  
	  dbms_output.put_line(st(i).num||' '||st(i).name||' '|| st(i).oracle_score||' '|| st(i).java_score||
	  						'   '||total_score||'  '||(total_score/2)); 
	   
	  if top_oracle < st(i).oracle_score then
	  	top_oracle :=st(i).oracle_score;
	  end if; 
	  
	    if top_java < st(i).java_score then
	  	top_java :=st(i).java_score;
	  end if;
	   
	end loop;
	dbms_output.put_line('===============================');  
	dbms_output.put_line('�ڹ��ְ����� ['||top_java||'] ����Ŭ �ְ����� ['||top_oracle||']');
	-- �ڹ��ְ����� [xx] ����Ŭ �ְ����� [xxx] 
	
 
   
   
   
    
 
end;
/		