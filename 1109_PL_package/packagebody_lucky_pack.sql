-- ����� �� (1~45�� �ϳ�) ��� �Լ�


create or replace package body lucky_pack
as              

-- ����� �� (1~45�� �ϳ�) ��� �Լ�   
----------------------------lucky_num ����
	function lucky_num return number
	is
	begin
	    return trunc(dbms_random.value(1,46));
	end lucky_num;
----------------------------lucky_num ��  
---------------------------- lucky_name ����

 	procedure lucky_name (name out varchar2)
	is 
		type name_tab is table of varchar2(30)
			index by binary_integer;
		
		name_arr name_tab;
		
		temp_num number;
		
	begin
		name_arr(1) := '����ȣ';
		name_arr(2) := '���ǽ�';
		name_arr(3) := '���ذ�';
		name_arr(4) := '����â';
		name_arr(5) := '����';
		name_arr(6) := '������';	
		name_arr(7) := '������';
		
		temp_num := trunc(dbms_random.value(1,name_arr.count+1));
		
		name := name_arr(temp_num);
											
	end lucky_name;	

---------------------------- lucky_name ��
---------------------------- ssn_maker ����     



 -----  create_ssn ���� -----  
		procedure create_ssn(birth varchar2, gender varchar2,
		name varchar2, ssn out char)     
		is
		--�ֹι�ȣ�� ������   ���̺�
			type ssn_tab is table of number(1)
				index by binary_integer;
			
			ssn_arr ssn_tab;	
			gender_num number :=2;
			temp_num number := 0;
			flag_num number :=2; 
			temp_ssn varchar2(5);
		    ssn_value varchar2(14);
		begin                  
			-- �Է¹��� ��������� ssn_tab�߰�
			for i in 1 .. length(birth) loop
				ssn_arr(i) := substr(birth,i,1);
			end loop;                                
			
			-- ���� ä��� 1       
			if gender ='����' then  
				gender_num := 1;
			end if;
			
		
			
			ssn_arr(7) := gender_num;
			--������ ��° �� ���� ä���.
			--880101123456x
			for i in 8 .. 12 loop
				ssn_arr(i) := trunc(dbms_random.value(0,10),0);
			end loop;   
			-- ������ �ֹι�ȣ�� ������ ���ڸ��� ä��� ���� ����
			for i in 1 .. ssn_arr.count loop
			   temp_num := temp_num + ssn_arr(i)* flag_num;
			   
			   flag_num := flag_num+1;
			   
			   if flag_num = 10 then
			   	flag_num :=2;
			   	end if;
			end loop;  
			
			--ä���������� �� �ڸ��� ����
			ssn_arr(13) := mod(11-mod(temp_num,11),10);
			
			ssn_value := birth||'-'||gender_num||ssn_arr(8)|| ssn_arr(9)||
			ssn_arr(10)||ssn_arr(11)||ssn_arr(12)||ssn_arr(13);
		
		
	        -----  create_ssn �� ----- 
	        ----- ������ �ֹι�ȣ�� class4_info�� �߰�
	        insert into class4_info(name, ssn)
	        values (name, ssn_value);
	        
	        ssn:=ssn_value;   
	        
	        
	        
	      end	create_ssn;  
	        
	        
	        	
--	function ssn_maker (ssn varchar2) 
--	return varchar2
--	is
--	
--	birth prompt '�������: '
-- 	gender prompt '����: '
--	
--	declare          
--	
--	 type rec_ssn 
--	 	(birth date,
--	 	gender varchar2);			
--	
--		gender_num number;
--		ssn_num number;
--
--	
--	begin
--	
--    	if gender = '����' then
--    		gender_num := 1;
--    	else
--    		gender_num := 2;
--    	end if; 
--    
--    dbms_output.put_line (to_char(birth,'yy-mm-dd')||'-'||gender_num);
--
--    
-- 	end ssn_maker;
---------------------------- ssn_maker ��     
 
/*
1.  lucky_pack ��Ű���� �¾�ظ� �Է¹����� �츦 ��ȯ�ϴ� 
  �Լ��� �߰��ϼ���.
  �� - �¾�ظ� 12�� ���� �������� 
      11�̸� ���, 10- ��, 9-��,8-��,7-�䳢,6-ȣ����,5-��,4-��,3-����,
      2-��,1-��,0-������
*/  
---------------------------- create_shu ����    

	function create_shu (birth number) return varchar2
    is 
    	
    	
     	shu_arr varchar2(60);
     	
     	temp_arr number:= 0;
     
    
     	
     	begin
     	
     	temp_arr := mod(birth,12); 
     	
    	 	
        
        if temp_arr = 0 then
        	shu_arr := '������';
        elsif temp_arr=1 then
			shu_arr := '��';  
		elsif temp_arr=2 then
			shu_arr := '��';
		elsif  temp_arr=3 then
			shu_arr :=	'����';
		elsif temp_arr=4 then
			shu_arr := '��';
		elsif  temp_arr=5 then
			shu_arr := '��';
		elsif  temp_arr=6 then
			shu_arr := 'ȣ����';		
		elsif  temp_arr=7 then
			shu_arr := '�䳢';	   	 
     	elsif  temp_arr=8 then
			shu_arr := '��';  
     	elsif temp_arr=9 then
			shu_arr := '��';
		elsif  temp_arr=10 then
			shu_arr := '��';
		elsif  temp_arr=11 then
			shu_arr := '��';
		else shu_arr := '�����?';
	
		end if; 

     	return  shu_arr;     
     	
     	
   end create_shu;  
   
   
/*
2. lucky_pack ��Ű���� �μ���ȣ�� �޾� emp ���̺��� �μ���
   ����� ��� �ټӳ���� out_parameter�� �����ϴ� procedure��
   �߰��ϼ���.
*/
	procedure avr_work (i_deptno number,
							avr out number)
	is
		cnt_p number (10) := 0;
		sum_y number (10) := 0;
	
	begin 
	
		select count(empno), sum(to_char(sysdate, 'yyyy') - to_char(hiredate,'yyyy')) 
		into   cnt_p, sum_y
		from  emp
		where deptno = i_deptno;
    
		avr := 0;
		
		avr := trunc(sum_y / cnt_p);	

	end avr_work;


end;
/
	
	

