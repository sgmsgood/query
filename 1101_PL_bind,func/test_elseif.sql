-- ���� if (else ~ if)
-- ������ �Է¹޾� ������ 0���� ���� ��� '0���� �۾Ƽ� ����'
-- 100���� ū ��� '100���� Ŀ�� ����' / �׷��� ���� ��� '����'

set serveroutput on
set verify off

accept score prompt '����: '

declare
  score number := &score;

begin
   
   	dbms_output.put(score); --> ��¿� score�� ���ֱ� ���ؼ�. �Ʒ� �Ŀ����� ��¿� �������� �� ����.
    
  	if score < 0 then
  		dbms_output.put_line('���� 0���� �۾Ƽ� ����');
  	elsif score > 100 then
  		dbms_output.put_line('���� 100���� Ŀ�� ����');
  	else 
  		dbms_output.put_line('���� �Է¼��� o(^^o)(o^^)o');
	end if;

end;
/