-- �ó�� ����
select *from user_synonyms;

create synonym tmp for table_multi_primary;
-- �ó���� ����Ͽ� DML����
select * from tmp;

insert into tmp(item_num, item, item_info)
values('ITEM_0003','�ٳ���','�ڿ����� ���̴��� ������ �̲�����');

-- �ó�� ����
drop synonym tmp;
