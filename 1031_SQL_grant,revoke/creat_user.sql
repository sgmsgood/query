-- �������� : ������ ������ ��������
-- create user ������ identified by ���;

-- ����â���� ������ �α��� ��� sqlplus "/as sysdba"
create user test_user identified by 1111;

-- (����â ���� grant connect to test; �̷��� �Է�)

-- ���ӱ��� ,�ڿ���� ����(resource) , ������ ����(dba)
grant connect,resource,dba to test;


--���̺� ���� (X) (Resource ������ �ο��Ǹ� ����)
create table my_table(num number);
insert into my_table values(1);
commit;

-- ������ ���� �ο� �� �Ϲݰ����� �������� ���� ���� �Ҽ� �ִ�.
-- ��������, ���� ���� �ο��Ѵ�.    -- �Ϲݰ��� scott������ ������-- ,
create view test_view as (select num from my_table);

select * from user_views;

drop view test_view;

-- ���� ȸ�� :
revoke ����,,,  from  ������;

create user tset1 identified by 2222;     --���� ���ܼ� ���� ���̺� �� ����--

--���� ���� : ������ ���ӵǾ� �ִٸ� �������� �ʴ´�.

select tname from tab;

-- ���� ��ȸ (all_users: ������, ��������, dba_users: ������ ���� �������� �� �� ����)
select * from dba_users;




