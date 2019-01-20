/* 1. �������� �Է¹޾� �������� Ư¡�� ��� �ϴ� PL/SQL�ۼ�.
   -�������� ��ҹ��� ��� �� ���� �ؾ��Ѵ�.
   -'A' : �������̴�. ���ɽ�����, �����ϴ�
   -'B' : �ڱ��߽����̴�. �����̳� ��Ģ, �ӹ��� ���� �Ⱦ��Ѵ�.
   -'AB' : �ո����̴�. �ո����� �ݵ����� ��ȣ�ϰԵȴ�. 
   -'O' :  �Ѱᰰ�� ��°� �������� �ִ�. �����ǽ��� ���ϴ�  */
   
   
set serveroutput on
set verify off

accept BT prompt '�������� �Է��ϼ���: '

declare
 	BT char(2) := upper('&BT');

begin  

	if BT in('A','B','O','AB') then
	
			if BT = 'A' then
				 dbms_output.put_line('�������̴�. ���ɽ�����, �����ϴ�.');
		
			elsif BT = 'B' then
				dbms_output.put_line('�ڱ��߽����̴�. �����̳� ��Ģ, �ӹ��� ���� �Ⱦ��Ѵ�.');
		
			elsif BT = 'O' then
				dbms_output.put_line('�Ѱᰰ�� ��°� �������� �ִ�. �����ǽ��� ���ϴ�.');   
			
			else  
				dbms_output.put_line('�ո����̴�. �ո����� �ݵ����� ��ȣ�ϰԵȴ�.');
			end if; 
	else 
		dbms_output.put_line('�ڷᰡ �����ϴ�.');
		
	end if;
end;
/           

/* 2. ������ �Է¹޾Ƽ�  
    100~90 ���̸� 'A'���� 
     89~80 ���̸� 'B'
    79~70 ���̸� 'C'
    69~60 ���̸� 'D'
    �׿� ��� '����� ����' �� ����ϴ�  PL/SQL�� �ۼ��ϼ��� */ 
    
set serveroutput on
set verify off

accept score prompt '������ �Է��ϼ���: '

declare
	score number := &score;

begin
	if  score between 90 and 100 then
		dbms_output.put_line('A');
	
	elsif score between 80 and 89 then 
	 	dbms_output.put_line('B');
	 	
	elsif score between 70 and 79 then 
		dbms_output.put_line('C');
		
	elsif score between 60 and 69 then 
		dbms_output.put_line('D');	
	
	else       
		dbms_output.put_line('����� ����.');
	
	end if;

end;
/   

/* 3. �̸��� �Է¹޾� ���� �̸��� ����ϴ�  PL/SQL�� �ϼ���.
    �̸��� ���ڼ��� 3�� ���϶�� '�ܼ�'���� �Ǵ��ϰ� 4�� �̻��̶�� 
    '����' �̶�� �Ǵ��Ѵ�.
    �ܼ�- ���� �ϳ��� �� (��: ��,��,��,��),  
    ���� - ���� �ΰ��μ� (�� : ������, �簥���� ��)
    �����  ��: ��  �̸� : ��ö */

set serveroutput on
set verify off

accept name prompt '�̸��� �Է��ϼ���.'

declare
	name varchar2(60) := '&name';

begin
	if length (name) <= 3 then
		dbms_output.put_line('��: '||substr(name,1,1)||' �̸�: '||substr(name,2));
 	elsif length (name) >= 4 then  
 	    dbms_output.put_line('��: '||substr(name,1,2)||' �̸�: '||substr(name,3));
	end if;

end;
/

/*
4. ��������� �Է¹޾�, '�ý�','����','����ö' �� ��쿡�� 
  �Ʒ��� ���� ������� �Ѵ� ����� �����ϼ���.
   �ý� : 3800 -
   ���� : 1200
   ����ö :1250��
 ��� : ����ٿ� ����ϴ� ��������� 'XX'�̰� �⺻ ���: xx ���Դϴ�.
      �պ������ xx���̰�, �Ѵ� 20�� ���� ������ xx�� �Դϴ�.
    �ý�, ����, ����ö�� �ƴ϶��  '���߱����� �ƴմϴ�.' �� ����ϼ���.
*/ 

set serveroutput on
set verify off

accept tr prompt ('��������� �Է��ϼ���: ')

declare
	tr varchar2(8) := '&tr';
	bus number := 3800;
	taxi number := 1200;
    train number := 1250;

begin 
	if tr in ('�ý�', '����ö','����') then
		if tr = '�ý�' then
		dbms_output.out_line('����ٿ� ����ϴ� ���������'||tr||'�̰� �⺻ ���: '||taxi||'�� �Դϴ�.
							 �պ������'||(taxi*2)||'�̰� �Ѵ� 20�� ���� ������ '||(taxi*2*20)||'�Դϴ�.';
		elsif tr = '����' then
		dbms_output.out_line('����ٿ� ����ϴ� ���������'||tr||'�̰� �⺻ ���: '||bus||'�� �Դϴ�.
							 �պ������'||(bus*2)||'�̰� �Ѵ� 20�� ���� ������ '||(bus*2*20)||'�Դϴ�.';
		else tr = '����ö' then
		dbms_output.out_line('����ٿ� ����ϴ� ���������'||tr||'�̰� �⺻ ���: '||train||'�� �Դϴ�.
							 �պ������'||(train*2)||'�̰� �Ѵ� 20�� ���� ������ '||(train*2*20)||'�Դϴ�.';
		end if;
    end if;

end;
/