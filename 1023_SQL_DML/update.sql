< update >
-- 조건에 맞는 레코드를 찾아 컬럼의 값을 변경하는 일
-- class4_info 테이블에서 학생의 번호가 "2"인 학생을 찾아서 이름을 '김희철'로 변경하시오.

/*
update class4_info
set       name = 'elen'
where  num = 2;
*/

commit;

--학생의 번호가 10번인 학생을 찾아서 이름을 '정원창', 나이 22, 이메일 lee@daum.net, 입력일 '현재날짜'

update class4_info
set	name = '정원창', age = 22, mail = 'lee@daum.net', input_date=sysdate
where	num = 10;

commit;

-- 학생의 번호가 10번이면서 이름이 '박영민'인 학생의 주민번호를 
-- '880101-7894561'로 변경하세요.

update class4_info
set  	ssn = '880101-7894561'
where	num = 11 or name  = '정원창';

commit;

update class4_info
set 	ssn = '900219-2268745', name = 'elen'
where 	num = 3;