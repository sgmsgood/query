
set serveroutput on
set verify off

accept tr prompt '��������� �Է��ϼ���: '

declare
	tr varchar2(8) := '&tr';
	taxi number := 3800;
	bus number := 1200;
    train number := 1250;

begin
	if tr in ('�ý�', '����ö','����') then
		if tr = '�ý�' then
		dbms_output.put_line('����ٿ� ����ϴ� ���������'||tr||'�̰� �⺻ ���: '||taxi||'�� �Դϴ�.
							 �պ������'||(taxi*2)||'�̰� �Ѵ� 20�� ���� ������ '||(taxi*2*20)||'�Դϴ�.');
		elsif tr = '����' then
		dbms_output.put_line('����ٿ� ����ϴ� ���������'||tr||'�̰� �⺻ ���: '||bus||'�� �Դϴ�.
							 �պ������'||(bus*2)||'�̰� �Ѵ� 20�� ���� ������ '||(bus*2*20)||'�Դϴ�.');
		else 
				dbms_output.put_line('����ٿ� ����ϴ� ���������'||tr||'�̰� �⺻ ���: '||train||'�� �Դϴ�.
							 �պ������'||(train*2)||'�̰� �Ѵ� 20�� ���� ������ '||(train*2*20)||'�Դϴ�.');
		end if;
	else dbms_output.put_line('���߱����� �ƴմϴ�.');
    end if;

end;
/
