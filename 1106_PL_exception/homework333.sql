--숙제1.
--제조사를 두개 입력받아 제조사에 해당하는 모든 차량의
-- 제조국, 제조사,모델명,년식,가격,옵션을 조회 하세요.
-- 출력은 가격의 오름차순으로 조회하였을 때 조회된 결과에 
--   3~6번째 레코드만  출력하세요.
--
--현대 기아를 입력하였을 때
-- 출력 예
-------------------------------------------------------------------
--번호 제조국  제조사  모델명  년식  가격   입력일 
-------------------------------------------------------------------
--1     국산     현대    아반테  2001  3,500 mm-dd-yyyy
-------------------------------------------------------------------
--검색 결과 아반테 [x]대, 소렌토 [x]대
--
--아반테 x대와 소렌토 x대는 검색 결과에 나온 대수만 카운트 합니다.
set serveroutput on
set verify off


  accept maker prompt'제조사  : '
declare

    type rec_car is record(country car_country.country%type,
    					   maker car_country.maker%type,
    					   model car_model.model%type,
    					   car_year car_model.car_year%type, 
    					   price car_model.price%type,
    					   hiredate car_model.hiredate%type
    					   );
    					   

	--선언된 record 데이터형으로 table 선언
    type tab_car is table of rec_car index by binary_integer;
    --선언된 table로 table 선언
    arr_car tab_car;
	cnt_h number:=0;
	cnt_k number:=0;
	i number :=0;
	j number :=0;
begin 
--번호 제조국  제조사  모델명  년식  가격   입력일 
 dbms_output.put_line('------------------------------------------------------');
 dbms_output.put_line('번호  제조국 제조사    모델명   년식     가격     입력일');
 dbms_output.put_line('------------------------------------------------------');
 
 	for temp in ( 
       select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.hiredate
       from  car_country cc, car_maker cma, car_model cmo
       where (cma.maker=cc.maker and cma.model=cmo.model) and cma.maker='&maker'
       order by cmo.price   
    )
     loop
	 i:=i+1;
	 arr_car(i):=temp;

	 end loop;

	 -- 생성된 데이터를 사용 하여 출력 형식을 만들어 출력한ㄷ.
	 for j in 1.. arr_car.count loop
	 --3~6 출력
         if j between 3 and 6 then
		  	 	dbms_output.put_line(j||'    '||arr_car(j).country||'   '||arr_car(j).maker||'      '||
		   						arr_car(j).model||'   '||
		   						arr_car(j).car_year||'   '||to_char(arr_car(j).price,'9999')||'   '||
		   						to_char(arr_car(j).hiredate,'mm-dd-yyyy'));
		   						-- 현다이 기아 카운트
 		   							
		   		if '&maker'='현대' then
		   		   cnt_h:=cnt_h+1;
		   		else
		   			cnt_k:=cnt_k+1;
				end if;
			
		   	 
		    end if;  
		   	
 		 

	end loop;     
     dbms_output.put_line('------------------------------------------------------');
     dbms_output.put_line('현대 :  '||cnt_h||'    기아는: '||cnt_k);
     
     
 end;
 /
