-- 점수를 입력받아 0~100 사이일 때 점수를 계산
-- 0~100 사이가 아니라면 입력 실패 출력
-- 0~100 사이일 때 0~40 사이라면 '과락' 41~60 - 다른 과목 참조
-- 61~100 '합격쓰 빼애ㅐㅇ애애앰'

set serveroutput on
set verify off

accept score prompt '점수: '

declare
	score number := &score;

begin
    
	if score between 0 and 100 then 
	  
	  if score<=40 then 
	  	dbms_output.put_line('과락');  
	  	
	  elsif score between 41 and 60 then 
	  	dbms_output.put_line('다른 과목 참조');
	  	
	  else
	   dbms_output.put_line('자격취득 합격쓰 o(^^o)(o^^)o');
      end if;
	else 
	 dbms_output.put_line('점수는 0~100사이만 입력해 주세요.');
     
	end if; 
end;
/	
	
