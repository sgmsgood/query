/*
숙제
1. 사원 테이블에서 사원번호,사원명, 연봉, 보너스를 조회
   단, 사원 번호를 내림차순 정렬 했을 때 // 3~5사이의 레코드만 출력 하고
      연봉은 7자리로 맞춰 출력하고 ,를 넣어 출력한다.
      해당 자리에 값이 없으면 0을 출력한다.
*/
select r, empno, ename, to_char(sal,'0,000,000') sal, comm
from (select rownum r, empno, ename, sal, comm
		from (select empno, ename, sal, comm
				from  emp
				order by empno desc))
where r between 3 and 5;

/*
2. class4_info 테이블에서 번호, 이름 , 나이, 태어난 해를 조회 하세요.
   태어난 해는 현재년도-나이+1 로 구합니다.

*/

select num, name, age, to_char(sysdate,'yyyy')-age+1
from class4_info;

/*
3. class4_info 테이블 번호, 이름 나이, 이메일, 이메일의 유효성 여부를
   조회.
   단, 이메일의 유효성은 '@' 이 없으면 '무효', '@'이 존재하면 '유효'를출력
*/
select*from class4_info;

select num, name, age, mail, decode(instr(mail,'@'),0,'무효','유효')
from class4_info
where mail is not null;


/*
4. car_model 테이블에서 옵션에 'ABS'나 '에어백'이 있는 차량의
    모델명,년식,가격,옵션, 이미지, 제조사를 조회 하세요.
    단, 가격의 오름차순으로 정렬하여 출력할 것.
*/
select model,car_year, price, car_option, car_img
from (select model, car_year, price, car_option
		from car_model
        where substr(car_model,)

from (select price
		from car_model
		order by price);

select*from car_model;
/*
5. car_model 테이블에서 모델명이 '아반테', '소렌토', 'A8'인 차량의
    모델명,모델별 가격 총합과 총계를 조회 하세요.
*/
select model, price, total, sum...
from car_model
where model like '아반테'or model like'소렌토'or model like'A8'
group by (model);
/*
6. car_model 테이블에서 차량 가액이 1500~3000 사이인 차량의
   모델명, 년식, 가격, 옵션, 입력일, 가격별 순위를 조회하세요.
   단, 가격별 순위는 중복되지 않는 번호가 출력되어야합니다.

7. 사원 테이블에서 입사년도가 1981년 이상이면서 매니저가 있는  사원의
   사원번호,사원명,연봉,매니저번호, 연봉 순위를 조회 하세요.
   단, 연봉순위는 동일한 연봉일 때 동일한 순위를 보여줍니다.

