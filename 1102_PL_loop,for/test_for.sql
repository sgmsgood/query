-- for: ���۰� ���� �� ���� �� �� �ְ� 1�� �����ϴ� �ݺ���

set serveroutput on

declare
--���� �ȸ��� ����
    i number;
    num number;
    total number; 
    msg varchar2(30);
begin

	for i in 1 .. 10 loop
		dbms_output.put_line('i='||i);
	end loop;
	-- for�� index�� �����ϴ� ������ declare���� ����� ������ ������� ����
		dbms_output.put_line('for ���� i='||i);  --> ��°�: for ���� i =  ����.

	-- 1~9���� 1�� �����ϴ� for�� ��������.
	num := 2;
	for i in 1 .. 9 loop
		dbms_output.put_line(num||'*'||i||'= '||num*i);
	end loop;

	-- 1~100������ ���� ���غ�����.
	total := 0;

	for idx in 1 .. 100 loop
		total := total + idx;
	end loop;
	 	dbms_output.put_line('1���� 100������ ����: '|| total);


	-- 2��~9��
	total := 0;

	for i in 2 .. 9 loop

		for j in 1 .. 9 loop
		 	dbms_output.put_line(i||'X'||j||'= '||i*j);
	
		end loop;	
    end loop;
	
dbms_output.put_line('-------------------------------------');

		for i in reverse 1..10 loop	
 		     dbms_output.put_line(i);
		end loop; 
		
dbms_output.put_line('-------------------------------------');
--������ �ݿ����Դϴ�. �غ���

	msg := '������ �ݿ����Դϴ�.';

	for i in 1 .. length(msg) loop
		dbms_output.put_line(substr(msg,i,1));
	end loop;
	
	
		
	
	
end;
/
