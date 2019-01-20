-- outer join: ��� ���� ���̺��� ���ڵ尡 �����ص� ��ȸ
-- ��� �μ� (40�� ��ȣ�� ���;� ��)�� �μ���ȣ, �μ���, �����ȣ, �����, �Ի����� ��ȸ

-- ANSI    (���ڵ尡 �ִ� ���� ����)

select d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from   emp  e
full outer join  dept d--> outer �������� / ���ڵ��� ������ �� �𸣸� full outer join���� ó��
on   e.deptno = d.deptno;

-- oracle  (���ڵ尡 ���� �ʿ� (+)�� ���δ�.)

select d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from dept d, emp e
where  (d.deptno=e.deptno(+)); ���ڵ� ���� �� (40 ���)
--where  (d.deptno(+)=e.deptno); ���ڵ� �ִ�  ��

-- �����簡 '����','���'�� "���" ������ ������, ������, �𵨸�, ����, ����, �ɼ��� ��ȸ�ϼ���.
select  cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from    car_country cc, car_maker cma, car_model cmo
where   (cma.maker(+)  = cc.maker and cmo.model(+) = cma. model)
and cma.maker in ('����','���');


-- �𵨸��� 'K5','K7','�ҳ�Ÿ','�ƹ���','Cclass','A6'�� ��� ������ ������
-- ������, ������, �𵨸�, ����, ������ ��ȸ
-- ��, ������ ������������ �����Ͽ� ��ȸ�� �� / ������ ���ٸ� ������ ��������

--ANSI
select cc.country, cma.maker, cmo.model, cmo.car_year, cmo.price
from car_model cmo
full outer join  car_maker cma
on     cmo.model = cma.model
full outer join car_country cc
on     cma.maker = cc.maker;

-- oracle
select cc.country, cma.maker, cmo.model, cmo.car_year, cmo.price
from car_model cmo, car_maker cma, car_country cc
where (cmo.model (+)= cma.model and cma.maker= cc.maker)
order by price desc, car_year desc;

-- ������̺���  "scott"�� ������� ������ ���� �޴� ����� �����ȣ, �����, �Ի���, ���� ��ȸ
select empno, ename, hiredate, sal
from emp
where sal < (select sal
			  from emp
			  where ename = 'SCOTT');

select el.empno, el.ename, el.sal, el.hiredate
from emp el, emp e2
where (el.sal< e2.sal) and e2.ename = 'SCOTT';

update car_model
set    car_img = 'qm5_001.jpg'
where  car_img = 'qm5_001.jpg, qm5_002.jpg';


update car_model
set    car_img = 'qm5_003.jpg'
where  car_img = 'qm5_003.jpg, qm5_004.jpg';


update car_model
set    car_img = 'qm5_005.jpg'
where  car_img = 'qm5_005.jpg, qm5_006.jpg';

commit;

select*from user_sequences;
