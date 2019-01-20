-- �ε����� ��ȸ
select *from user_indexes;

create  table cp_zipcode as(select * from zipcode);

select count(*) from zipcode

-- cp_zipcode���̺� seq �÷��� 'unique index ����;
create index idx_zipcode on cp_zipcode (seq);

create index idx_zipcode on cp_zipcode (seq);

drop index idx_zipcode;

select* from idx_zipcode;

-- �ε����� ������� �ʴ� ��ȸ  (full scan)
select zipcode, sido, gugun, bunji, seq
from zipcode
where zipcode='402-866';

-- �ε����� ����� ��ȸ
select /*+ ordered index (bit_zipcode)*/zipcode, sido, gugun, bunji, seq
from cp_zipcode
where zipcode = '402-866';

-- �����ȣ�� �ߺ������� ��Ư�� ���¸� ���´�.
create index bit_zipcode on cp_zipcode(zipcode);
select * from user_indexes;

-- �ε����� �������̺��� ����Ǹ� ��������� �������� ����
-- ���̺�� �ε����� �����ϰ� ���ߴ� ����
alter index bit_zipcode rebuild;







--=======================group by having��
-- having: �׷����� ���� ����
-- �μ��� ��� ���� 4�� �̻��� �μ��� �μ���ȣ, �����, ������, �ְ����� ��ȸ��
--
select deptno, count(deptno), sum(sal), max(sal)
from emp
group by deptno
having count(deptno)>4;

-- replace: ���� �����ϴ� �� (ġȯ)
select replace('���� ����ȣ�Դϴ�.','����','�״�')
from dual;

select*from user_objects;

drop table zipcode;
drop table cp_zipcode;
drop table emp;
purge recyclebin;


