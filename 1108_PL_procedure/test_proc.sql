create table test_proc as
(select empno, ename, hiredate, sal, job
 from emp
 where 1=0);


alter table test_proc
add constraint pk_test_proc primary key (empno);

select * from user_constraints
where constraint_type='P';

-- insert_test_proc 프로시저를 실행
var msg varchar2(300);
var cnt number;

-- 직접 실행
exec insert_test_proc(1111,'테스트',3000,'주임',:msg, :cnt);

-- 실행 결과
print msg;
print cnt;

-- 제약사항: 1. 사원번호 1~9999번까지, 0번 입력, 10000번 입력

exec insert_test_proc(10000,'테스트',3000,'주임',:msg, :cnt);

-- 실행 결과
print msg;
print cnt;

-- 제약사항: 2. 연봉 2500~8000사이, 2500이하 2500으로
-- 			 				  8000이상이라면 8000으로

exec insert_test_proc(1113,'테스트',8500,'주임',:msg, :cnt);

-- 실행 결과
print msg;
print cnt;

-- 제약사항 3: 사원, 주입, 대리, 과장, 차장, 부장, 이사
exec insert_test_proc(1114,'테스트',1400,'알바',:msg, :cnt);

-- 실행 결과
print msg;
print cnt;

-- 제약사항 4: 4. 영어라면 첫자를 대문자로
exec insert_test_proc(1115,'kim',1400,'사원',:msg, :cnt);

-- 실행 결과
print msg;
print cnt;

-- 제약사항 5.: 사원명이 길게 입력되는 경우 -> exception
exec insert_test_proc(1115,'제스퍼류',5000,'과장',:msg, :cnt);

-- 실행 결과
print msg;
print cnt;


select * from TEST_PROC;
