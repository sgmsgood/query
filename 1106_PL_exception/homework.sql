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

accept maker_1 prompt '1. 제조사를 입력하세요: '
accept maker_2 prompt '2. 제조사를 입력하세요: ' 

declare 
	
	type rec_car is record( r number,
							country car_country.country%type,
							maker car_maker.maker%type,							
							model car_model.model%type,
							car_year car_model.car_year%type,
							price car_model.car_year%type,
							hiredate car_model.hiredate%type
							); 
							
	type tab_car is table of rec_car index by binary_integer;
	
	arr_car tab_car;
	
	search_cnt_1 number :=0; 
	search_cnt_2 number :=0;
	
	i number := 0;		
 

begin
	dbms_output.put_line('-----------------------------------------------------');
    dbms_output.put_line('번호   제조국    제조사   모델명   년식   가격   입력일 ');
    dbms_output.put_line('------------------------------------------------------');  
    
    for temp in 
     select r, country, maker, model, car_year, price, car_option, hiredate
     from (select rownum r, country, maker, model, car_year, price, car_option, hiredate
      		from (select   cc.country, cc.maker, cmo. model, cmo.car_year, cmo.price, cmo.car_option, cmo.hiredate
      				from    car_country cc, car_maker cma, car_model cmo 
     				where   (cma.maker=cc.maker and cmo.model=cma.model) and (cma.maker='&maker_1'or cma.maker='&maker_2') 
       		 		order by cmo.price))
      where r between 3 and 6  
      )
           	
      loop 
      
   		i := i+1;
    	arr_car(i) := temp;
    	
    	if arr_car(i) = '&maker_1' then
    		search_cnt_1 = search_cnt_1+1;	  
    	
    	elsif arr_car(i) = '&maker_2' then
    		search_cnt_2 = search_cnt_2+1;
    	
    	end if;
  	
      end loop;         
   
      for i in 1 .. arr_car.count loop
    	
      dbms_output.put_line(i||arr_car(i).country||' '||arr_car(i).maker||' '||to_char(arr_car(i).car_year,'mm-dd-yy')||' '||
    						to_char(arr_car(i).price,'9,999')||' '||arr_car(i).hiredate||' '||
    							car_option);
	  end loop;
        dbms_output.put_line('------------------------------------------');
        dbms_output.put_line('현대: ['||search_cnt_1||']대 기아: ['||search_cnt_2||']대' );

end;
/   