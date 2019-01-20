/* 숙제 1.
제조사를 두개 입력받아 제조사에 해당하는 모든 차량의
 제조국, 제조사,모델명,년식,가격,옵션을 조회 하세요.
 출력은 가격의 오름차순으로 조회하였을 때 조회된 결과에 
   3~6번째 레코드만  출력하세요.

아반테, 소렌토를 입력하였을 때
 출력 예
-----------------------------------------------------------------
번호 제조국  제조사  모델명  년식  가격   입력일 
-----------------------------------------------------------------
1     국산     현대    아반테  2001  3,500 mm-dd-yyyy


-----------------------------------------------------------------
검색 결과 현대 [x]대, 기아 [x]대

아반테 x대와 소렌토 x대는 검색 결과에 나온 대수만 카운트 합니다.

*/

set serveroutput on
set verify off

accept maker1 prompt '제조사1: '
accept maker2 prompt '제조사2: '

declare
      
	type rec_car is record ( r number,
							country car_country.country%type,
							maker car_maker.maker%type,
							model car_maker.model%type,
							car_year car_model.car_year%type,
							price car_model.price%type,
							hiredate car_model.hiredate%type);
							
	type tab_car is table of rec_car index by binary_integer;
	
	arr_car tab_car;
	
	search_cnt_1 number := 0;
	search_cnt_2 number := 0;
	
	i number := 0;
		

begin  

	dbms_output.put_line('-------------------------------------------------------------');
	dbms_output.put_line('번호   제조국    제조사    모델명    년식    가격     입력일'); 
	dbms_output.put_line('-------------------------------------------------------------');
	
	for temp in(
	
		select  r, country, maker, model, car_year, price, hiredate 
		from (
		select rownum r, country, maker, model, car_year, price, hiredate
				from (select 	cc.country, cma.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate 
			 			from    car_country cc, car_maker cma, car_model cmo
						where 	(cma.maker = cc.maker and cma.model = cmo.model) and (cma.maker='&maker1' or cma.maker ='&maker2')
	    				order by cmo.price) 
	   	where r between 3 and 6)
	   	
	   	) 
	   	
	loop 
	
	  i := i+1;
	  arr_car(i) := temp;
	 
	 if (arr_car(i) = '&maker1') then
	  	search_cnt_1 := serch_cnt_1+1;
	  	
	  elsif (arr_car(i) = '&maker2') then
	  	search_cnt_2 := serch_cnt_2+1; 
	  	
	  end if;
	
	  
	end loop; 
	
		for i in 1 .. arr_car.count loop
			dbms_output.put_line(i||arr_car(i).country||arr_car(i).maker||arr_car(i).model||arr_car(i).car_year
								  ||to_char(arr_car(i).price,'9,999')
								  ||to_char(arr_car(i).hiredate,'mm-dd-yyyy'));
		end loop;
		
 	dbms_output.put_line('검색결과:'||'&maker1'||search_cnt_1||']대, 기아['||serch_cnt_2||']대');
	  
	  
	

end;
/