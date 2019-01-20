-- �ԷµǴ� �ֹι�ȣ�� ��ȿ�� ����
-- ���ڼ��� 14�ڸ�, 7��° �ڸ��� '-'�� �����ϴ���

create or replace function check_ssn (ssn char)
return varchar2
is 
	result_msg varchar2(7) := 'fail';
		
begin
	if length (trim(ssn))=14 and instr(ssn,'-')=7 then 
	  result_msg := 'success';
	end if;         
	
	return result_msg;
	
end;
/
