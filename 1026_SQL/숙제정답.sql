select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

숙제
/*1. 사원 테이블에서 사원번호,사원명, 연봉, 보너스를 조회
   단, 사원 번호를 내림차순 정렬 했을 때 3~5사이의 레코드만 출력 하고
      연봉은 7자리로 맞춰 출력하고 ,를 넣어 출력한다.
      해당 자리에 값이 없으면 0을 출력한다. */
select rownum, r_num, empno, ename, to_char(sal,'0,000,000'), comm
from (select rownum r_num, empno, ename, sal, comm
		from emp)
where r_num between 3 and 5
order by empno desc;


/*2. class4_info 테이블에서 번호, 이름 , 나이, 태어난 해를 조회 하세요.
   태어난 해는 현재년도-나이+1 로 구합니다. */
select num, name, age, to_char(sysdate,'yyyy')-age+1 as birth
from class4_info;



/*3. class4_info 테이블 번호, 이름 나이, 이메일, 이메일의 유효성 여부를
   조회.
   단, 이메일의 유효성은 '@' 이 없으면 '무효', '@'이 존재하면 '유효'를출력 */
select * from CLASS4_INFO;
select num, name, age, email, case instr(email,'@') when 0 then '무효' else '유효' end
from class4_info;
where instr(email, '@') >=0;


/*4. car_model 테이블에서 옵션에 'ABS'나 '에어백'이 있는 차량의
    모델명,년식,가격,옵션, 이미지, 제조사를 조회 하세요.
    단, 가격의 오름차순으로 정렬하여 출력할 것.*/

select * from CAR_MODEL;
select * from CAR_MAKER;
select * from CAR_HOMEWORK;

--create table car_homework as (select model, car_year, price, car_option from car_model);

select model, car_year, price, car_option, car_img, (select maker from car_maker where car_maker.model=car_model.model) maker
from car_model
where instr(car_option,'ABS')<>0 or instr(car_option,'에어백')<>0
order by price;

select model, car_year, price, car_option, car_img, (select maker from car_maker where car_maker.model=car_model.model) maker
from car_model
where car_option like '%ABS%' or car_option like '%에어백%'
order by price;


/*5. car_model 테이블에서 모델명이 '아반테', '소렌토', 'A8'인 차량의
    모델명,모델별 가격 총합과 소계, 총계를 조회 하세요.*/
select model, price, sum(price), (select maker from car_maker where car_maker.model=car_model.model) maker
from car_model
where model in('아반테','소렌토','A8')
group by rollup(model,price)
order by model;

 select * from CAR_MODEL;

/*6. car_model 테이블에서 차량 가액이 1500~3000 사이인 차량의
   모델명, 년식, 가격, 옵션, 입력일, 가격별 순위를 조회하세요.
   단, 가격별 순위는 중복되지 않는 번호가 출력되어야합니다.*/
select model, car_year, price, car_option, hiredate, row_number() over(order by price) rank
from car_model
where price between 1500 and 3000;


/*7. 사원 테이블에서 입사년도가 1981년 이상이면서 매니저가 있는  사원의
   사원번호,사원명,연봉,매니저번호, 연봉 순위를 조회 하세요.
   단, 연봉순위는 동일한 연봉일 때 동일한 순위를 보여줍니다.*/
select * from EMP;

select empno, ename, sal, mgr, rank() over(order by sal)
from emp
where to_char(hiredate,'yyyy')>=1981 and mgr is not null;
