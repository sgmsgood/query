-- �Ű����� ���� �Լ�: �������� ����Ͽ� 10�ڸ��� 
-- 1�� �����ϴ� ���������� ���ڿ��� ��ȯ�ϴ� �Լ�
-- �������� ���� 'ITEM_00001'

create or replace function item_num
return char
is
 temp_num char(10);
 seq_num number;
 -- 
begin

--	select seq_item.nextval
--	into	seq_num
--	from	dual;
	seq_num := seq_item.nextval; (�� ������)

	temp_num := concat('ITEM_',lpad(seq_num,5,0) );
	
	return temp_num;
	
end;
