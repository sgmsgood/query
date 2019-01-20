
select * from CAR_MODEL;
select * from CAR_MAKER;
select * from CAR_COUNTRY;

update car_model
set		car_img='qm5_001.jpg'
where   car_img='qm5_001.jpg,qm5_002.jpg';

update car_model
set		car_img='qm5_003.jpg'
where   car_img='qm5_003.jpg,qm5_004.jpg';

update car_model
set		car_img='qm5_005.jpg'
where   car_img='qm5_005.jpg,qm5_006.jpg';
commit;


     /*
숙제
1. 배기량이 1500~3000 사이인 차량의
	제조국 제조사 모델명 년식 가격 이미지 입력일 옵션, 배기량을 조회
	단, 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고
	옵셧은 처음 ','까지만 출력할 것.
	가격과 연식은 3자리마다 ,를 넣어 출력
	입력일은 월-일-년의 형식으로 출력 할 것.
	*/

select country, maker, model, to_char(car_year, '9,999'),
				to_char(price, '9,999'), car_img, to_char(hiredate,'mm-dd-yyyy'),
				substr(car_option,1,instr(car_option,',')), cc
from(select rownum num, country, maker, model, car_year,
					price, car_img, hiredate, car_option, cc
	from( select  cc.country, cc.maker, cma.model, cmo.car_year,
					cmo.price, cmo.car_img, cmo.hiredate, cmo.car_option, cmo.cc
			from   	CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo
			where   (cma.maker  = cc.maker and cmo.model = cma.model)
				and cmo.cc between 1500 and 3000
			order by cmo.cc desc))
where num between 3 and 6;
/*
2. 부서번호가 10과, 30,40번인 모든 부서의
	사원번호,사원명,입사일,연봉,연봉순위,부서명,부서번호,위치,우편번호,시도,구군,동,번지를 조회
	단, 출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력할 것
	우편번호는 '-'뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체하여 출력
	 입사일은 월-일-년 요일까지 출력
*/
select * from ZIPCODE;

select empno, ename, to_char(hiredate,'mm-dd-yyyy'), sal, deptno, row_number() over( order by sal asc) as sal_rank,
	dname, loc,
    substr(zipcode,instr(zipcode,'-'))zipcode,
    sido, gugun, dong, nvl(bunji,'번지없음')
from(select rownum num, empno, ename, hiredate, sal, deptno,
			dname, loc,
		    zipcode, sido, gugun, dong, bunji
	from(select e.empno, e.ename, e.hiredate, e.sal, e.deptno,
				d.dname, d.loc,
			    z.zipcode, z.sido, z.gugun, z.dong, z.bunji
		from emp e, dept d, zipcode z
		where (e.deptno(+) = d.deptno and z.seq = e.empno)
			and (e.deptno = 10 or e.deptno = 30 or e.deptno = 40)
		order by e.empno))
where num between 2 and 5;


/*
3. 차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고 옵션에 'ABS','TCS'가
 있는 차량의  제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회
  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬하여 출력,
   이미지는 이미지명과 확장자를 구분하여 출력할것,
   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .
*/
select  cc.country, initcap(cc.maker), cma.model, cmo.car_year,
		cmo.price, cmo.car_option ,substr(cmo.car_img,1,instr(cmo.car_img,'.')-1) as img_name ,substr(cmo.car_img,instr(cmo.car_img,'.')+1) as 확장자, cmo.cc
from   	CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo
where   (cma.maker  = cc.maker and cmo.model = cma.model)
		and cma.maker in ('현대', '기아', '삼성', 'BMW', 'AUDI')
		and (instr(car_option, 'ABS') > 0 or instr(car_option, '에어백') > 0 )
order by cmo.car_year desc, cmo.price desc;

/*
4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 모델명, 제조국,
  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
  단, 출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.
*/
select	'[' || model || '] 차량의 연식은 [' || car_year || ']이고, 제조국은 [' || country || ']이며, [' || maker || ']사가 제조사입니다. 가격은 [' || to_char(price, '9,999') || ',000' || '] 원 입니다.' as result
from(select  rownum num, model, country, maker, price, car_year
	from(select  cma.model, cc.country, cc.maker, cmo.price, cmo.car_year
		from   	CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo
		where   (cma.maker  = cc.maker and cmo.model = cma.model)
				and cmo.model in ('K5', '아반테', '소렌토', 'A8', 'SM3')
		order by cmo.price))
where num between 2 and 7;

/*
5. 제조사가 '현대'인 차량의 년식, 모델명, 연식별 총가격을 조회.
*/
select cmo.car_year, cmo.model, sum(cmo.price)
from car_maker cma, car_model cmo
where (cmo.model = cma.model) and cma.maker = '현대'
group by rollup(cmo.car_year, cmo.model);


/*
6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인
   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액,
   부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회
   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산
     연봉인상액은 부서번호에 따라 차등 인상
     10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
     계산하여 3자리마다 ,를 넣어 출력.
     모든 영어는 소문자로 출력.
*/

select e.empno, lower(e.ename), e.hiredate, to_char(e.sal, '9,999'),
	e.sal * 0.033 as 세금, to_char(e.sal + (e.sal/12) + nvl(e.comm,0) - (e.sal * 0.033), '9,999') as 실수령액,
	case e.deptno
		when 10 then to_char(e.sal*0.07, '9,999')
		when 20 then to_char(e.sal*0.04, '9,999')
		when 30 then to_char((e.sal+nvl(e.comm,0))*0.1, '9,999')
		else to_char(e.sal*0.03, '9,999')
	end as 연봉인상액,
	e.deptno, lower(d.dname), lower(d.loc),
	z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.deptno = d.deptno and z.seq = e.empno)
	and e.ename like '__A_S';
