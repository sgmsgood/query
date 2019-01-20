var cur_dept refcursor;

exec select_all_dept (:cur_dept);

print cur_dept;

-- 부서번호 입력하여 부서별 사원 정보 조회
var cur_emp refcursor;
-- 부서번호 :10, 20, 30
exec select_emp(11,:cur_emp);

print cur_emp;
