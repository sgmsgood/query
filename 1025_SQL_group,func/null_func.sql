-- null��ȯ
-- ���ڵ带 �߰��� �� �÷��� ������� ������ null�� �Էµ�
-- varchar2(char) : �÷��� ������� �ʰų�, ''(Ȧ ����ǥ 2��)�� ��� null �Է�
-- number, date: �÷��� ������� ���� ���.

select * from emp;

-- ������̺��� �����, ����, ���ʽ� ��ȸ
-- ��, ���ʽ��� ���� ������� 100���� ���

select ename, sal, nvl(comm, 100)
from emp;

-- �����ȣ���̺��� �̓��� ���� �����ȣ, �õ�, ����, ��, ���� ��ȸ
-- ��, ������ ���ٸ� '��������'�� ����ϼ���
select sido, gugun, dong, nvl(bunji,'��������') bunji
from zipcode
where dong like '����1��%';

-- class4_info���̺��� ��ȣ, �̸�, �Է����� ��ȸ
-- ��,�Է����� ���ٸ� ���� ��¥�� ����ϼ���
select num, name, nvl(input_date, sysdate) input_date
from class4_info;

	select * from CLASS4_INFO
