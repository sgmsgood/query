-- ��ȯ�Լ�
-- ���ڿ��� �ƴ� ��(���� or ��¥)�� ���ڿ��� ��ȯ
-- 1) ���� : ������ �ڸ��� ' , ' �� ' . ' �� ���

select to_char(20181025,'0,000,000,000'),
	   to_char(20181025,'9,999,999,999')
from dual;

select to_char(2018.1025,'999,999.999')
from dual;

-- ������̺��� �����ȣ, �����, �Ի���, ���� ��ȸ
-- ��, ������ �����Ͱ� �ִ� �ͱ����� ,�� �־� ���
select empno, ename, hiredate, to_char(sal,'9,999,999')
from emp;

--> ������ ���� ���ڿ���! �Ʒ������ϸ� ������
select to_char(sal,'9,999')+100
from emp;

-- ��¥ -> ���ڿ���ȯ
select to_char(sysdate,'yyyy-mm-dd am hh(hh24):mi:ss dy(day) q') today
from dual;

-- pattern�� Ư�����ڰ� �ƴ� ���ڿ� ����� ������ " "�� ���´�.
select to_char(sysdate,'yyyy"�� "mm"�� "dd"��"')
from dual;

-- pattern�� �ʹ� ��� ����ϸ� error
select to_char(sysdate,'yyyy " �� "mm "��" dd " �� " hh24 " �� "') ||to_char(sysdate,' mi " �� " ss " �� " ')
from dual;

-- ������̺��� �����ȣ, �����, �Ի����� ��ȸ�ϼ���.
-- ��, �Ի����� '��-��-�� ����'�� �������� ����ϼ���.
select   empno, ename, to_char(hiredate,'yyyy"�� " mm "�� " dd "�� " day')
from emp;

-- ������̺��� �Ի�⵵�� '1981'���� �������
-- �����ȣ, �����, �Ի���, ������ ��ȸ�ϼ���.
select empno, ename, hiredate, sal
from emp
where to_char(hiredate,'yyyy')='1981'; --> ���ڿ����� ���ϱ� ���ؼ� hiredate�� ���ڿ��� �ٲٴ� ��

select * from class4_info;

-- ���糯¥�� �ƴ� ��¥�� �߰��� ��
-- ��¥ ������ ���ڿ��� �߰��ϸ� �ȴ�.

insert into class4_info(num, name, input_date) values (8,'�缼��', '2018-10-21');
insert into class4_info(num, name, input_date) values (9,'�缼��', to_date('2018-10-21','yyyy-mm-dd'));

select to_char(input_date, 'yyyy-mm')
from class4_info;

-- to_char�� ��¥�� ���ڸ� �Է¹޾ƾ� �� (�Լ��� ��(����)�� ������ ���� ������)

select to_char (to_date('2018-10-25'),'mm')
--> '2018-10-25'�� �����̱� ������ ���� ����
--> to_date('2018-10-25')�� ���ڿ��� �ٲٰ�, 'mm'�� ���ض�
from          dual;

-- ���� ��ȯ: to_number('���������� ���ڿ�')
select '25'-'10', to_number('25') - to_number('10') ;
--*oracle�� ' '�ȿ� ���ڰ� ������ ���ڿ�������, ���ڷ� �� �ν��ؼ� ó����



------------------------------------
-- �����Լ�

-- decode
-- ������̺��� ������� ,�����, ����, �μ��� ��ȸ
-- ��, �μ����� �Ʒ��� ǥ�� �ش��ϴ� �μ������� ���
-- 10 ���ߺ�, 20 ����������, 30-ǰ�������� �� �ܿ��� Ź����

select empno, ename, sal, deptno, decode(deptno,10,'���ߺ�', 20, '����������', 30,'ǰ��������','Ź����') dname
from emp;


-- �����ȣ, �����, �μ���ȣ, ���� , �μ�Ƽ��
-- �μ�Ƽ��� �μ����� �Ʒ��� ǥ�� ���� ���������� ��
-- 10 - ������ 20%, 20 - ������ 50%, 30 - ������ 30% �� �ܴ� ������ 5%

select empno, ename, deptno, sal, decode(deptno, 10, sal*0.2, 20, sal*0.5, 30, sal*0.1) incen
from emp;


-- case (decode�� ��)
-- ������̺��� ������� ,�����, ����, �μ��� ��ȸ
-- ��, �μ����� �Ʒ��� ǥ�� �ش��ϴ� �μ������� ���
-- 10 ���ߺ�, 20 ����������, 30-ǰ�������� �� �ܿ��� Ź����

select   empno, ename, sal, deptno,
		case deptno when 10 then '���ߺ�'
					when 20 then '����������'
					when 30 then 'ǰ��������'
					else 'Ź����'
		end  dname
from emp;

-- �����ȣ, �����, �μ���ȣ, ���� , �� ���ɾ�
-- �� ���ɾ��� ���� + ���ʽ� + �μ�Ƽ��� ����
-- �μ�Ƽ��� �μ����� �Ʒ��� ǥ�� ���� ���������� ��
-- 10 - ������ 20%, 20 - ������ 50%, 30 - ������ 30% �� �ܴ� ������ 5%
select empno, ename, deptno, sal,
		case sal when 10 then sal + sal * 0.2 + nvl(comm,0)
				 when 20 then sal + sal * 0.5 + nvl(comm,0)
				 when 30 then sal + sal * 0.3 + nvl(comm,0)
				 else sal + sal * 0.1 + nvl(comm,0)
				 end total
from emp;

select * from test_like;

-- ��� ���̺��� �����ȣ, �����, ������ ��ȸ
-- ��, ������ ù ���ڰ� 'C'- �Ҹ�ǰ, 'S'- �޹���
-- 'M'-������, 'A'-���캸�� ���, 'P'-�θ�

select empno, ename, job,
		decode (substr(job,1,1),'C','�Ҹ�ǰ', 'S', '�޹���', 'M', '������','A', '���캸�� ���', 'P', '�θ���') who
from emp;

