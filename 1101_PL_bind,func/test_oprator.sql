-- �ܺΰ� �Է� �ޱ�
set serveroutput on
set verify off

accept name prompt '�̸�:'
accept age prompt '����:'

declare
		name varchar2(90);
		age number;

begin
--�Էµ� ���� ������ �Ҵ�
-- �Է� ���� ���ڿ��� ��쿡�� '�� ��� ���ȴ�.
--  �۵���! �״ϱ� ������ �ּ����� ��������!
		name :='&name';
		age := &age; 
        --birth := to_char(sysdate,'yyyy')-age+1
        -->dbms_output.put_line(age||'�� �¾ ��:'||birth||'�� ��');
	
		                                                                                              
		-- �¾ �� ���: xx�� �¾�� xxxx�� ��
		-- 1) ���ڿ��� ������ �ȵ�. ������ + 1  -> �׷��� ����Ŭ�� ���ڰ� ���ڷθ� �̷������ �˾Ƽ� �� ����ϴµ�...  
		-- 2) ||�� +, - ���� �� ���� ����� �Ǵϱ�  to_char(sysdate)�� ���� �������� ����. �׷��� �����߻�
		-- 3) ���ϱ� (  )�� �ļ� ���� ����ؾ� �� �κ��̶�� Ȯ�ν������ ��.
	 	dbms_output.put_line(age||'�� �¾ ��:'||((to_char(sysdate,'yyyy')) - age + 1)||'�� ��');
		
		-- ��� �����ڰ� �ƴ� �������� ����� ����� �� �ִ�.	 	
		-- dbms_otput.put_line(age>10); 

end;
/
