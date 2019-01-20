����
/* 1. ��� ���̺��� '10' �μ��� �ƴϸ鼭 ������ 1000�̻� 3000������
��� �������  �����ȣ,�����, �Ի���,�μ���ȣ, ������ ��ȸ�ϼ���.*/

select empno, ename, hiredate, deptno, sal
from emp
where sal>=1000 and sal<=3000 and deptno != 10;


/*2. ��� ���̺��� ���ʽ��� �����ϴ� �������  �����ȣ,�����,
    ����,���ʽ�, �Ѽ��ɾ�, ������ ��ȸ �ϼ���.
    - ������ ������ 12������ ���� ����� ��. */

select empno, ename, sal, comm, sal+comm total, sal/12 mm
from   emp;

/*3. ��� ���̺��� �μ���ȣ�� 10,30��  ������� �����, �����ȣ, �Ի���, ������ ��ȸ �ϼ���.
    -��, �����  xxxx�� xxxx����� xxxx�⿡ �Ի��Ͽ��� ������ xxx$�Դϴ�.
        �� �������� �ϰ�, �÷����� output ���� �����Ұ�. */

select empno||' �� '||ename||' ����� '||hiredate||' �� '|| sal || '$ �Դϴ�.' output
from emp
where deptno = 10 or deptno = 30;




/*4. ��� ���̺��� ������ 3000 �̸��� ������� �����ȣ, �����,
   �Ի���, ����,����, �μ���ȣ�� ��ȸ �ϼ���.
   ��, ������ ������������ �����ϵ� ������ ���ٸ� ������� ������������
   �����Ұ�.*/
select empno, ename, hiredate, sal, job, deptno
from   emp
where  sal < 3000
order by sal, ename desc;

/*5. test_like ���̺� �Ʒ��� ���� �����͸� �߰��Ұ�.
    7, ����������,����� ���۱� �󵵵�,'�����'
    8, ���븸,����� ���빮�� ���빮1��,'��Ÿ��'
    9, ���¼�,����� ���빮�� ���빮2��,'�����'*/
insert into test_like values(7, '����������','����� ���۱� �󵵵�','�����');
insert into test_like values(8, '���븸','����� ���빮�� ���빮1��','��Ÿ��');
insert into test_like values(9, '���¼�','����� ���빮�� ���빮2��','�����');

select * from test_like;

/* 6. test_like ���̺��� '�����'�� �����ϴ� �л���  ��ȣ,�л���,
    �ּ�, �б������� �Ʒ���  ���� �������� ����ϰ�
     �÷����� ��ҹ��� �����Ͽ� Output����  �Ұ�.
    ������� :  ��ȣ : x, �̸� : xx, �ּ� : xx, �б� : xx
*/

select '��ȣ : '||num|| ', �̸�: '||name||', �ּ�: '||loc||', �б�: '||highschool "Output"
from   test_like
where loc like '�����%';


/* 7. ������̺��� ������� 4�����̰ų� ������ 3000�̻��� �����
   �����ȣ, �����, ����, �Ի���, �μ���ȣ, ������ ��ȸ�Ұ�.
   ��, ��� �����ʹ� ������ ������������ �����ϰ�, ������ ���ٸ�
     ������� ���� �������� �����Ұ�. */
select empno, ename, sal, hiredate, job
from   emp
where  ename like '____' or sal >=3000
order by sal, ename;

/* 8.  test_like ���̺��� ����б����� ����ϰ� �б����� ����
    �������� �����Ͽ� ����� ��.
    ��, ����б� ���� ���ٸ� �ϳ��� ����ϼ���.(2������ �� ��.) */

select distinct highschool
from    test_like
order by highschool;

/*
9. ��� ���̺��� �����ȣ, �����, �Ի���, ����, ���⿬����
    ��ȸ �ϼ���.
    ���� ������ ���� �������� 7% ���� �ݾ����� ����Ͽ� ����Ұ�.
*/
select empno, ename, hiredate, sal, sal*0.07 next_year
from   emp;
/*
10. ��� ���̺��� ������� 5�����̸鼭 ����° ���ڿ� 'A'�� ���
    �� ����� �����, �����ȣ, �Ի���, ������ ��ȸ�ϼ���.
    ��, ������ ������������ ����Ұ�.
*/

select ename, empno, hiredate, sal
from emp
where ename like '__A__'
order by ename;

/*
11. ��� ���̺��� ������� 'A'�� �����ϸ鼭 ������ 1600�̻���
     ����� �����,����,����, �Ŵ�����ȣ, �Ի����� ��ȸ �Ұ�.
*/
select empno, sal, job, mgr, hiredate
from  emp
where ename like 'A%' and sal >= 1600;

select * from emp;







