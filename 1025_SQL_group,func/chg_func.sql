-- 변환함수
-- 문자열이 아닌 값(숫자 or 날짜)을 문자열로 변환
-- 1) 숫자 : 지정한 자리에 ' , ' 나 ' . ' 을 출력

select to_char(20181025,'0,000,000,000'),
	   to_char(20181025,'9,999,999,999')
from dual;

select to_char(2018.1025,'999,999.999')
from dual;

-- 사원테이블에서 사원번호, 사원명, 입사일, 연봉 조회
-- 단, 연봉은 데이터가 있는 것까지만 ,를 넣어 출력
select empno, ename, hiredate, to_char(sal,'9,999,999')
from emp;

--> 나오는 값은 문자열임! 아래같이하면 에러남
select to_char(sal,'9,999')+100
from emp;

-- 날짜 -> 문자열변환
select to_char(sysdate,'yyyy-mm-dd am hh(hh24):mi:ss dy(day) q') today
from dual;

-- pattern이 특수문자가 아닌 문자열 사용할 때에는 " "로 묶는다.
select to_char(sysdate,'yyyy"년 "mm"월 "dd"일"')
from dual;

-- pattern을 너무 길게 사용하면 error
select to_char(sysdate,'yyyy " 년 "mm "월" dd " 일 " hh24 " 시 "') ||to_char(sysdate,' mi " 분 " ss " 초 " ')
from dual;

-- 사원테이블에서 사원번호, 사원명, 입사일을 조회하세요.
-- 단, 입사일은 '년-월-일 요일'의 형식으로 출력하세요.
select   empno, ename, to_char(hiredate,'yyyy"년 " mm "월 " dd "일 " day')
from emp;

-- 사원테이블에서 입사년도가 '1981'년인 사원들의
-- 사원번호, 사원명, 입사일, 연봉을 조회하세요.
select empno, ename, hiredate, sal
from emp
where to_char(hiredate,'yyyy')='1981'; --> 문자열끼리 비교하기 위해서 hiredate를 문자열로 바꾸는 것

select * from class4_info;

-- 현재날짜가 아닌 날짜를 추가할 때
-- 날짜 형식의 문자열을 추가하면 된다.

insert into class4_info(num, name, input_date) values (8,'양세찬', '2018-10-21');
insert into class4_info(num, name, input_date) values (9,'양세형', to_date('2018-10-21','yyyy-mm-dd'));

select to_char(input_date, 'yyyy-mm')
from class4_info;

-- to_char은 날짜나 숫자를 입력받아야 함 (함수의 값(인자)은 데이터 형을 구분함)

select to_char (to_date('2018-10-25'),'mm')
--> '2018-10-25'가 문자이기 때문에 읽지 못함
--> to_date('2018-10-25')를 숫자열로 바꾸고, 'mm'을 구해라
from          dual;

-- 숫자 변환: to_number('숫자형식의 문자열')
select '25'-'10', to_number('25') - to_number('10') ;
--*oracle은 ' '안에 숫자가 있으면 문자열이지만, 숫자로 잘 인식해서 처리함



------------------------------------
-- 조건함수

-- decode
-- 사원테이블에서 사원번보 ,사원명, 연봉, 부서명 조회
-- 단, 부섭명은 아래의 표에 해당하는 부서명으로 출력
-- 10 개발부, 20 유지보수부, 30-품질보증부 그 외에는 탁구부

select empno, ename, sal, deptno, decode(deptno,10,'개발부', 20, '유지보수부', 30,'품질보증부','탁구부') dname
from emp;


-- 사원번호, 사원명, 부서번호, 연봉 , 인센티브
-- 인센티브는 부서별로 아래의 표와 같이 차등지급할 것
-- 10 - 연봉의 20%, 20 - 연봉의 50%, 30 - 연봉의 30% 그 외는 연봉의 5%

select empno, ename, deptno, sal, decode(deptno, 10, sal*0.2, 20, sal*0.5, 30, sal*0.1) incen
from emp;


-- case (decode와 비교)
-- 사원테이블에서 사원번보 ,사원명, 연봉, 부서명 조회
-- 단, 부섭명은 아래의 표에 해당하는 부서명으로 출력
-- 10 개발부, 20 유지보수부, 30-품질보증부 그 외에는 탁구부

select   empno, ename, sal, deptno,
		case deptno when 10 then '개발부'
					when 20 then '유지보수부'
					when 30 then '품질보수부'
					else '탁구부'
		end  dname
from emp;

-- 사원번호, 사원명, 부서번호, 연봉 , 총 수령액
-- 총 수령액은 연봉 + 보너스 + 인센티브로 구성
-- 인센티브는 부서별로 아래의 표와 같이 차등지급할 것
-- 10 - 연봉의 20%, 20 - 연봉의 50%, 30 - 연봉의 30% 그 외는 연봉의 5%
select empno, ename, deptno, sal,
		case sal when 10 then sal + sal * 0.2 + nvl(comm,0)
				 when 20 then sal + sal * 0.5 + nvl(comm,0)
				 when 30 then sal + sal * 0.3 + nvl(comm,0)
				 else sal + sal * 0.1 + nvl(comm,0)
				 end total
from emp;

select * from test_like;

-- 사원 테이블에서 사원번호, 사원명, 직무를 조회
-- 단, 직무의 첫 글자가 'C'- 소모품, 'S'- 앵버리
-- 'M'-감시인, 'A'-살펴보는 사람, 'P'-두목쓰

select empno, ename, job,
		decode (substr(job,1,1),'C','소모품', 'S', '앵벌이', 'M', '감시인','A', '살펴보는 사람', 'P', '두목찡') who
from emp;

