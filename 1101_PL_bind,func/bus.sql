
set serveroutput on
set verify off

accept tr prompt '교통수단을 입력하세요: '

declare
	tr varchar2(8) := '&tr';
	taxi number := 3800;
	bus number := 1200;
    train number := 1250;

begin
	if tr in ('택시', '지하철','버스') then
		if tr = '택시' then
		dbms_output.put_line('출퇴근에 사용하는 교통수단은'||tr||'이고 기본 요금: '||taxi||'원 입니다.
							 왕복요금은'||(taxi*2)||'이고 한달 20일 기준 교통비는 '||(taxi*2*20)||'입니다.');
		elsif tr = '버스' then
		dbms_output.put_line('출퇴근에 사용하는 교통수단은'||tr||'이고 기본 요금: '||bus||'원 입니다.
							 왕복요금은'||(bus*2)||'이고 한달 20일 기준 교통비는 '||(bus*2*20)||'입니다.');
		else 
				dbms_output.put_line('출퇴근에 사용하는 교통수단은'||tr||'이고 기본 요금: '||train||'원 입니다.
							 왕복요금은'||(train*2)||'이고 한달 20일 기준 교통비는 '||(train*2*20)||'입니다.');
		end if;
	else dbms_output.put_line('대중교통이 아닙니다.');
    end if;

end;
/
