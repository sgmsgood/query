-- 문자열 함수 사용


-- 길이를 알고 싶다 : length(문자열)
select 'oracle 길이: '||length('oracle')||'자',length('테스트')
from dual;
-- 사원테이블에서 사원명, 사원명의 글자수 조회
select ename, length(ename)
from emp;
-- 사원테이블에서 사원명이 4자 이상인 사원명을 조회
select ename
from   emp
where length(ename)> 4; -- (=ename like '연산자 불가능')

-- 대문자: upper
select upper('Test'), upper('테스트 AbcdE')
from dual;

-- 소문자: lower
select lower('Test')
from dual;

-- 사원테이블에서 사원명이 'scott'인 사원의 사원번호,사원명, 입사일, 연봉을 조회하셈

select  empno, ename, hiredate, sal
from emp
where lower(ename) = 'scott'; --> 1) 레코드를 소문자로 바꾸든지
--where ename=upper('scott'); --> 2) 입력값을 대문자로 바꾸든지

--사원테이블에서 사원명을 모두 소문자로
select lower (ename)
from  emp;


-- 문자열 위치 찾기:: instr(문자열, 찾을 문자열)
select instr('AbcdeF','A'), instr('AbcdeF','F'), instr('AbcdeF','c')
	, instr('AbcdeF','a') --> 없는 값이라서 0값 출력
from dual;

insert into Class4_info (num, name, mail) values(6, '테스트','test@kr');
insert into Class4_info (num, name, mail) values(7, '테스트1','test.kr');
commit;

select * from class4_info;

--> 학생테이블에서 번호, 이름, 이메일, 이메일의 유효성 조회
select num, name, mail, instr(mail,'@'), instr(mail,'.')
from class4_info;

-- 문자열 자르기 : substr(문자열,시작 인덱스, 자를 글자수) /자를 글자수가 없으면 처음~끝/
select substr('Abcdefg',4, 3),substr('Abcdefg',2, 4), substr('Abcdefg',2)
from dual;

-- class4_info테이블에서 번호, 이름, mail 컬럼의 메일주소만 조회하세요.
-- test@test.com (메일주소 @도메인)
select num, name, substr(mail,1,instr(mail,'@')-1)
from class4_info;

-- class4_info테이블에서 번호, 이름, mail 컬럼의 도메인주소만 조회하세요.
-- test@test.com (메일주소 @도메인 )
select num, name, substr(mail,instr(mail,'@')+1)
--> instr(mail,'@'): @가 있는 문자열의 위치를 알려줘 -> +1 : 그 위치에서 1을 더한 뒷자리부터 알려주면 돼.
from class4_info;

-- 공백제거: 1) 앞뒤 공백제거 trim, 앞 공백제거: ltrim, 뒷 공백제거: rtrim
select '['||trim('   A BC   ')||']', '['||ltrim('   A BC   ')||']', '['||rtrim('   A BC   ')||']'
		,trim('a' from 'aaaaaaaaOracleaaaa') --> 특정 문자열 제거
from   dual;

-- 첫 글자를 대문자로: initcap('문자열')
select initcap('very very hungry soSad REAL')
from dual;

select initcap(ename)
from emp;

-- 문자열 붙이기: concat('문자열', '붙일 문자열')
select concat ('abc', 'DEF'), concat (concat('abc', 'DEF'),'ghI'), 'abc'||'DEF'||'ghI'
from dual;

-- 문자열 채우기
-- 왼쪽으로 채우기: lpad('문자열', 총 자릿수, '채울 문자열')
select    lpad('ABCDE',7,'$'), lpad('ABCDEFG',10,0)
from dual;

-- 오른쪽으로 채우기: rpad('문자열', 총 자릿수 , '채울 문자열')
SELECT rpad('ABCDEF',10,'가'),rpad('abcde',10,'배') --> 여유공간 5byte, 한글 2byte : 출력 배 두 글자
from dual;

