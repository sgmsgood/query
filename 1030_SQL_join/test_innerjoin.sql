-- inner join: ���� �ٸ� ���̺� ���� ���� �ִ� ��쿡�� ��ȸ.
select * from emp;

-- �����ȣ, �����, �μ���ȣ, �μ���, ��ġ, ���� ��ȸ

------- ANSI
SELECT        e.EMPNO, e.ENAME, e.DEPTNO, d.DNAME, d.LOC, e.SAL
FROM          EMP  e
INNER JOIN    DEPT d
ON            d.DEPTNO = e.DEPTNO; -->(�ڿ� ���� �ְ� �������� ������ �� -> emp���� �̾Ƴ�)

------- ORACLE
SELECT        e.EMPNO, e.ENAME, e.DEPTNO, d.DNAME, d.LOC, e.SAL
FROM          EMP  e, dept d
where 		  e.deptno = d.deptno;


select * from CAR_MAKER;
select * from CAR_COUNTRY;
-- ������ ���̺� PK ����
alter table car_country add constraint pk_car_country primary key (maker);
-- ������ ���̺� FK ����
alter table car_maker add constraint fk_maker foreign key (maker) references car_country(maker);
-- �� ���̺� PK ����
alter table car_maker add constraint pk_maker primary key (model);
-- �� ���̺��� FK ����
alter table car_model add constraint fk_model foreign key (model) references car_maker(model);

-- �𵨸��� '�ƹ���', '�ҳ�Ÿ'/ ,'A8'�� ������
-- ������, ������, �𵨸�, ����, ����, �̹��� ���� ��ȸ�ϼ���.

-- ANSI
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from   		 car_country cc
inner join   car_maker cma
on           cma.maker = cc.maker
inner join   car_model cmo
on           cmo.model = cma.model
where        cma.model in('�ƹ���', '�ҳ�Ÿ','A8');

-- oracle
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from   car_country cc, car_maker cma, car_model cmo
where (cma.maker = cc.maker and cmo.model = cma.model) and cma.model in('�ƹ���', '�ҳ�Ÿ','A8');

-- �����ȣ, �����, ����, �Ի���, �μ���ȣ, �μ���, ��ġ, //�����ȣ, �õ�, ����, ��, ������ ��ȸ�ϼ���.
-- ������̺��� �����ȣ�� �����ȣ ���̺��� seq�� ������ �������� ����ϼ���.

-- ANSI
select e.empno, e.ename, e. sal, e.hiredate, d.deptno, d.dname, d.loc, z.zipcode, z.sido, z.gugun, z.dong, bunji
from   emp e
inner join dept d
on e.deptno = d.deptno
inner join zipcode z
on  z. seq = e.empno
where z.seq in (e.empno);

-- ORACLE
select e.empno, e.ename, e. sal, e.hiredate, d.deptno, d.dname, d.loc, z.zipcode, z.sido, z.gugun, z.dong, bunji
from emp e, dept d, zipcode z
where (e.deptno = d.deptno and z.seq = e.empno) and z.seq in (e.empno);

