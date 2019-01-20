-- 단일 if: 조건에 맞는 경우에만 코드를 실행 해야할 때
-- 이름을 입력받아 이름이 '류이호'라면 이름출력 전에 
-- '국민 남친'을 출력하시오. 다른 이름은 이름만 출력하시오.
 
set serveroutput on
set verify off

accept name prompt '오~ 익뜨큐드미~??? ' 

declare  -- declare은 명령이 끝나면 항상 ';'적기
--	name varchar2(15);
	name table_primary.name%type := '&name';
	
begin       
	if name ='루루인대오' then
	    dbms_output.put_line('똥고양이!');
	end if;      
	
	dbms_output.put_line(name||'저리가때여');
end;
/

