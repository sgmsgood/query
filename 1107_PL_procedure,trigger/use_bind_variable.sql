-- bind ������ ���
-- 1. bind ���� ����: var[variable] ������ �������� (ũ��)

var name varchar2(30);
variable age number; 

set serveroutput on

-- 2. bind���� �� �Ҵ� : ������
declare
	name varchar2(30);
begin
	 name := '�׽�Ʈ'; 
	 
	 -- 3. ���ε� ������ �� �Ҵ�
	 
	:name := name||'�� ���õ� �޷������?';
	:age  := 20;
	
	dbms_output.put_line(name||' '|| :name || ' '|| :age); 
	
	

end;
/

--4. ���ε� ������ �� ���
	print name age;
