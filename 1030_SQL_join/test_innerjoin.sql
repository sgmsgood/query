-- inner join: 서로 다른 테이블에 같은 값이 있는 경우에만 조회.
select * from emp;

-- 사원번호, 사원명, 부서번호, 부서명, 위치, 연봉 조회

------- ANSI
SELECT        e.EMPNO, e.ENAME, e.DEPTNO, d.DNAME, d.LOC, e.SAL
FROM          EMP  e
INNER JOIN    DEPT d
ON            d.DEPTNO = e.DEPTNO; -->(뒤에 나온 애가 연산자의 기준이 됨 -> emp에서 뽑아냄)

------- ORACLE
SELECT        e.EMPNO, e.ENAME, e.DEPTNO, d.DNAME, d.LOC, e.SAL
FROM          EMP  e, dept d
where 		  e.deptno = d.deptno;


select * from CAR_MAKER;
select * from CAR_COUNTRY;
-- 제조국 테이블에 PK 설정
alter table car_country add constraint pk_car_country primary key (maker);
-- 제조사 테이블에 FK 설정
alter table car_maker add constraint fk_maker foreign key (maker) references car_country(maker);
-- 모델 테이블에 PK 설정
alter table car_maker add constraint pk_maker primary key (model);
-- 모델 테이블은 FK 설정
alter table car_model add constraint fk_model foreign key (model) references car_maker(model);

-- 모델명이 '아반테', '소나타'/ ,'A8'인 차량의
-- 제조국, 제조사, 모델명, 연식, 가격, 이미지 명을 조회하세요.

-- ANSI
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from   		 car_country cc
inner join   car_maker cma
on           cma.maker = cc.maker
inner join   car_model cmo
on           cmo.model = cma.model
where        cma.model in('아반테', '소나타','A8');

-- oracle
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from   car_country cc, car_maker cma, car_model cmo
where (cma.maker = cc.maker and cmo.model = cma.model) and cma.model in('아반테', '소나타','A8');

-- 사원번호, 사원명, 연봉, 입사일, 부서번호, 부서명, 위치, //우편번호, 시도, 구군, 동, 번지를 조회하세요.
-- 사원테이블의 사원번호와 우편번호 테이블의 seq를 조인의 조건으로 사용하세요.

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

