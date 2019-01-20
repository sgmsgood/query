select * from user_procedures;
-- 외부변수 선언
var msg varchar2(300);
var cnt number;

-- 직무 이외의 직무 입력
execute update_test_proc(1112,'주임',3000, :cnt, :msg);
-- 처리 결과 출력
print msg;
print cnt;


select * from test_proc;

-- 연봉계산
execute update_test_proc(1115,'주임',2490,:cnt,:msg);
-- 처리 결과 출력
print msg;
print cnt;

-- 프로시저 실행
execute update_test_proc(1112,'주임',3000, :cnt, :msg);
-- 처리 결과 출력
print msg;
print cnt;

-- 삭제: 존재하는 사원번호로 삭제, 존재하지 않는 사원번호로도 삭제
exec delete_test_proc(1111,:msg, :cnt);

print msg;
print cnt;

-- 조회: 직급에 대한 사원수, 연봉합 조회
var sal number;
exec select_test_proc_cnt('대리우스',:msg,:cnt,:sal);

print msg;
print cnt;
print sal;

select*from test_proc;

-- 동 이름으로 우편번호 검색
var msg1 varchar2(300);
exec search_zipcode('상도동', :msg, :cnt);

print msg;
print cnt;


-- sys_refcursor의 사용
var cur_dept refcursor;

-- sys_refcursor를 저장
exec select_all_dept(:cur_dept);

-- 출력
print cur_dept;
