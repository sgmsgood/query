--�����Լ�
select sin(25), cos(25), tan(25)
from dual;

-- ����: abs��
select abs(25), abs(-25)
from   dual;

-- �ݿø�: round(��, �ڸ���)
select round(777.774,2), round(777.774,-1)
from   dual;


-- ����: trunc(��, �ڸ���)
select trunc(777.777, 2), trunc(777.777, -1)
from dual;

-- �ø�: ceil(��)
select ceil(10.1), ceil(10.9)
from dual;

-- ����: floor(��)
select floor(10.8), floor(45.1)
from dual;

-- ������̺��� �����ȣ, �����, �Ի���, ����, ������ ��ȸ�ϼ���
-- ��, ������ ������ 3.3%�� ����ϰ�, '�� ���� �����Ͽ� ���'
select  empno, ename, hiredate, sal, trunc(sal*0.033, -1) tax
from emp;    
      




