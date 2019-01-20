-- outer join: 어느 한쪽 테이블에만 레코드가 존재해도 조회
-- 모든 부서 (40번 번호도 나와야 함)의 부서번호, 부서명, 사원번호, 사원명, 입사일을 조회

-- ANSI    (레코드가 있는 쪽을 선택)

select d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from   emp  e
full outer join  dept d--> outer 생략가능 / 레코드의 구조를 잘 모르면 full outer join으로 처리
on   e.deptno = d.deptno;

-- oracle  (레코드가 없는 쪽에 (+)를 붙인다.)

select d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from dept d, emp e
where  (d.deptno=e.deptno(+)); 레코드 없는 쪽 (40 출력)
--where  (d.deptno(+)=e.deptno); 레코드 있는  쪽

-- 제조사가 '현대','기아'인 "모든" 차량의 제조국, 제조사, 모델명, 연식, 가격, 옵션을 조회하세요.
select  cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from    car_country cc, car_maker cma, car_model cmo
where   (cma.maker(+)  = cc.maker and cmo.model(+) = cma. model)
and cma.maker in ('현대','기아');


-- 모델명이 'K5','K7','소나타','아반테','Cclass','A6'인 모든 차량의 제조국
-- 제조국, 제조사, 모델명, 연식, 가격을 조회
-- 단, 가격의 내림차순으로 정렬하여 조회할 것 / 가격이 같다면 연식의 내림차순

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

-- 사원테이블에서  "scott"인 사원보다 연봉을 적게 받는 사원의 사원번호, 사원명, 입사일, 연봉 조회
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
