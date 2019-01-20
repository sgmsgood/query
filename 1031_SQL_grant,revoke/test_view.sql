-- view�� �����Ϸ��� ������ ������ ���� ������ view ���� ������ �ο�
-- ���� ������ �ο��ؾ��Ѵ�.
-- ������ ������ ���� �ο�

grant create view to ������;

-- �ܼ� view ���� (���̺� �ϳ��� ������ view)
create view test_view as (select * from emp);

create view emp_view as (select * from cp_emp3);

select * from user_views;

select * from emp_view;
select * from cp_emp3;

-- view DML

insert into emp_view(empno, ename, deptno, job, sal)
values (1234, '������ ', 20, '����', 4000);
commit;

update emp_view
set    job = '����', sal = 4100
where  empno = 1234;

select * from emp_view;

select * from emp_view;
commit;

delete from emp_view
	where empno = 1234;

-- view ����
drop view emp_view;
select*from user_views;

-- �ܼ� view (�ϳ��� ���̺� ��� �÷����� view ����)
-- cp_emp3���̺��� �����ȣ, �����, ����, �������� view ����
create view emp_view as
	(select empno, ename, job, sal from cp_emp3);

/*
������ ���
��� (����, ����ȣ, ��ȭ��ȣ)
������ (����, ����ȣ, ��ȭ��ȣ, �ֹι�ȣ, ī���ȣ)
*/

select * from emp_view;

-- view�� ���Ե��� ���� �÷��� insert�� �����ϸ� null�� �Էµȴ�.

insert into emp_view(empno, ename, job, sal)
values (1234,'������','����','4100');

select * from cp_emp3;

/* ���� view: ���̺� �������� ����Ͽ� ������ view
			��ȸ�� �� �Լ��� ����Ͽ� ��ȸ�� ����� ������ view.
            - insert, update, delete�� ������� �ʴ´�.
            - �������� select�� ������ �ܼ� select�� ����Ͽ� ��ȸ�� ��. */

delete from car_view;

create view car_view as
 (select cma.maker, cma.model, cmo.car_year, cmo.price, cmo.cc, cmo.car_option
 	from car_maker cma, car_model cmo
 	where cma.model = cmo.model);

-- view�� ����ϸ� join�� ����� �ܼ� ������ ���� �� �ִ�.
select maker, model, car_year, price, cc, car_option
from car_view
where maker = '����';

-- ���� view�� DML(insert, update, delete)�� ������ �ʴ´�.
insert into car_view(maker, model, car_year, price, cc, car_option)
values ('����', '���ν���', 2017, 3000, 1999, '��¦ 3��,ABS');

-- �ܼ� view�� insert, update, delete ���� view ������ with read only
create view read_emp as
(select * from CP_EMP2) with read only;

select * from user_views;

select * from read_emp;          

-- with read only �ɼ��� ����� view�� �߰�, ����, ������ �� �� ����.
insert into read_emp (empno, ename, hiredate, sal)
values (1234, '������', sysdate, 5000);



