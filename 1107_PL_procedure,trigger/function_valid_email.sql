-- �̸����� ��ȿ�� ������ [6�� �̻��̸鼭  @'�� '.' ����]�� �����ϴ� �Լ��� ���鲿��
-- ������ ����ϸ� '��ȿ, '��ȿ'

create or replace function valid_mail(mail varchar2)
return char
is
	result_msg char(6) := '��ȿ';
	

begin
	if length(mail) > 6 and instr(mail,'@') != 0
		and instr(mail,'.')  <>0 then
		result_msg := '��ȿ';
	
	end if;

    return result_msg;
end;

