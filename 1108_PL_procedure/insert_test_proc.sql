-- 사원번호, 사원명, 연봉, 직급(job)을 입력받아 test_proc에 추가하는 procedure을 작성하세요.
-- 사원번호는 1~9999 사이의 값만 입력되어야 합니다.

-- 연봉은  2500~8000사이만 입력되어 함.
-- 2500이하라면 2500으로, 8000 이상이라면 8000으로 설정하여 출력
-- 직급은 사원, 주임, 대리, 과장, 차장, 부장, 이사만 입력되었을 때에만 추가함

-- 사원명은 영어인 경우 첫 자를 대문자로 변경하여 추가
-- 중복된 사원번호가 입력되면 예외로 처리한다.

create or replace procedure insert_test_proc(
		empno number,
		ename varchar2,
		sal number,
		job varchar2,
		msg out varchar2,
		row_cnt out number)

is

    temp_sal number := sal;

begin

-- 제약사항 1.

	if empno between 1 and 9999 then
-- 제약사항 2.
		if temp_sal < 2500 then
		   temp_sal := 2500;
		   end if;

		if temp_sal > 8000 then
			temp_sal := 8000;
		 end if;
-- 제약사항 3.
		if  job in ('사원', '주임', '대리', '과장', '차장', '부장') then

		    insert into test_proc(empno,ename, hiredate, sal, job)
		    values(empno, initcap(ename), sysdate, temp_sal, job);

		    row_cnt := sql%rowcount;

		    commit;

		    msg:= empno||'번 사원 정보가 추가되었습니다.';

		else
			msg:= job||'은 입력가능한 직급이 아닙니다.';
		end if;

	else
		msg := empno||'사원번호는 1~9999 사이만 입력가능';

	end if;

		exception
		when dup_val_on_index then
			msg := empno||'번 사원번호는 이미 존재합니다.';   
			row_cnt:=0;
		when others then
--			msg := '예외발생'||sqlerrm||'/'||sqlcode;
			if sqlcode = -12899 then
			 msg := ename||'명은 한글 3자 영어 10자를 초과하였습니다.';  
			 row_cnt:=0;
			end if;

end;
/
