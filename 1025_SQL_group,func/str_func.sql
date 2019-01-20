-- ���ڿ� �Լ� ���


-- ���̸� �˰� �ʹ� : length(���ڿ�)
select 'oracle ����: '||length('oracle')||'��',length('�׽�Ʈ')
from dual;
-- ������̺��� �����, ������� ���ڼ� ��ȸ
select ename, length(ename)
from emp;
-- ������̺��� ������� 4�� �̻��� ������� ��ȸ
select ename
from   emp
where length(ename)> 4; -- (=ename like '������ �Ұ���')

-- �빮��: upper
select upper('Test'), upper('�׽�Ʈ AbcdE')
from dual;

-- �ҹ���: lower
select lower('Test')
from dual;

-- ������̺��� ������� 'scott'�� ����� �����ȣ,�����, �Ի���, ������ ��ȸ�ϼ�

select  empno, ename, hiredate, sal
from emp
where lower(ename) = 'scott'; --> 1) ���ڵ带 �ҹ��ڷ� �ٲٵ���
--where ename=upper('scott'); --> 2) �Է°��� �빮�ڷ� �ٲٵ���

--������̺��� ������� ��� �ҹ��ڷ�
select lower (ename)
from  emp;


-- ���ڿ� ��ġ ã��:: instr(���ڿ�, ã�� ���ڿ�)
select instr('AbcdeF','A'), instr('AbcdeF','F'), instr('AbcdeF','c')
	, instr('AbcdeF','a') --> ���� ���̶� 0�� ���
from dual;

insert into Class4_info (num, name, mail) values(6, '�׽�Ʈ','test@kr');
insert into Class4_info (num, name, mail) values(7, '�׽�Ʈ1','test.kr');
commit;

select * from class4_info;

--> �л����̺��� ��ȣ, �̸�, �̸���, �̸����� ��ȿ�� ��ȸ
select num, name, mail, instr(mail,'@'), instr(mail,'.')
from class4_info;

-- ���ڿ� �ڸ��� : substr(���ڿ�,���� �ε���, �ڸ� ���ڼ�) /�ڸ� ���ڼ��� ������ ó��~��/
select substr('Abcdefg',4, 3),substr('Abcdefg',2, 4), substr('Abcdefg',2)
from dual;

-- class4_info���̺��� ��ȣ, �̸�, mail �÷��� �����ּҸ� ��ȸ�ϼ���.
-- test@test.com (�����ּ� @������)
select num, name, substr(mail,1,instr(mail,'@')-1)
from class4_info;

-- class4_info���̺��� ��ȣ, �̸�, mail �÷��� �������ּҸ� ��ȸ�ϼ���.
-- test@test.com (�����ּ� @������ )
select num, name, substr(mail,instr(mail,'@')+1)
--> instr(mail,'@'): @�� �ִ� ���ڿ��� ��ġ�� �˷��� -> +1 : �� ��ġ���� 1�� ���� ���ڸ����� �˷��ָ� ��.
from class4_info;

-- ��������: 1) �յ� �������� trim, �� ��������: ltrim, �� ��������: rtrim
select '['||trim('   A BC   ')||']', '['||ltrim('   A BC   ')||']', '['||rtrim('   A BC   ')||']'
		,trim('a' from 'aaaaaaaaOracleaaaa') --> Ư�� ���ڿ� ����
from   dual;

-- ù ���ڸ� �빮�ڷ�: initcap('���ڿ�')
select initcap('very very hungry soSad REAL')
from dual;

select initcap(ename)
from emp;

-- ���ڿ� ���̱�: concat('���ڿ�', '���� ���ڿ�')
select concat ('abc', 'DEF'), concat (concat('abc', 'DEF'),'ghI'), 'abc'||'DEF'||'ghI'
from dual;

-- ���ڿ� ä���
-- �������� ä���: lpad('���ڿ�', �� �ڸ���, 'ä�� ���ڿ�')
select    lpad('ABCDE',7,'$'), lpad('ABCDEFG',10,0)
from dual;

-- ���������� ä���: rpad('���ڿ�', �� �ڸ��� , 'ä�� ���ڿ�')
SELECT rpad('ABCDEF',10,'��'),rpad('abcde',10,'��') --> �������� 5byte, �ѱ� 2byte : ��� �� �� ����
from dual;

