<delete>
-- ���̺� ��� ���ڵ带 �����ϰų�, ���ǿ� �´� Ư�� ���ڵ带 
-- ������ �� ����ϴ� ����

-- 1) ��� ���ڵ带 ���� ��

delete from class4_info;

-- 2) Ư�� ���ڵ常 ����
-- �л��� ��ȣ�� 11���� �л��� ���ڵ带 �����Ұ���

/*
delete from class4_info
where num = 11;
*/

-- truncate�� ���̺��� ���ڵ带 �����Ѵ�.
-- �ڸ� ���� �ٽ� ���� �� ����

/*
truncate table class4_info;
*/

-- �ʿ���� ���̺� ����
-- ���� �� ���̺��� Oracle10g ���� ���������� �̵��Ѵ�.

drop table class4_info;

-- ������ ����: sqlplus
-- show recyclebin (; �Ƚᵵ ��)
-- ������ ����: sqlplus
-- purge recyclebin
-- ������ ���̺� ����: sqlplus
-- flashback table �������̺�� to before drop