/* 숙제
  -- 차량 모델을 입력받아 테이블에서 car_model테이블에서 년식, 가격, 옵션, 입력일을 조회하세요.
  -- 출력: xxxx모델 검색 결과
  		--------------------------------------------
  		년식		가격		입력일			옵션
  		--------------------------------------------
  		2010	1,990  월-일-년 분기	처음 ,까지만 조회
  		--------------------------------------------
  		검색 대수 [x]대
  		
  		년은 2자리만 조회,s
  		가격의 오름차순 정렬하여 조회
  		(커서, 레코드, 테이블을 모두 사용하여 출력합니다.)
 */	
 

set serveroutput on
set verify off

accept model prompt '모델을 입력하세요: '

declare
  	cursor cur_carmodel is
			select  model, car_year, to_char(price,'9,999'), to_char(hiredate,'yy-mm-dd q') hiredate, substr(car_option,1,instr(car_option,','))
			from 	car_model
			where	model='&model'
			order by price; 

	type rec_carmodel is record (
							model car_model.model%type,
							car_year car_model.car_year%type,
							price varchar2(9),
							hiredate varchar2(20),
							car_option car_model.car_option%type
							);
	type tab_carmodel is table of rec_carmodel index by binary_integer; 
	
	carmodel_data rec_carmodel;                  
    arr_carmodel tab_carmodel;
    
    i number :=0; --초기화
    
begin

	if cur_carmodel%isopen then -- car_model 커서가 열려있는가
	   close cur_carmodel;      -- 열려있다면 커서를 닫아  (커서가 2번 열릴 수 없기 때문에 미리 닫아줌)
	end if;

     open cur_carmodel;    -- carmodel커서를 열어주고 
     
     loop
	   fetch cur_carmodel into carmodel_data; -- carmodel_data에서 carmodel커서를 불러와 (데이터를 가지고 오는 부분)

	   exit when cur_carmodel%notfound; -- carmodel에서 커서에서 결과값이 없으면 끝내
-- 		데이터 처리 	   
--		exit when not cur_emp%found;
		i := i+1;								
		arr_carmodel(i) := carmodel_data; -->>?
		 		
	end loop; 

    if i != 0 then
	dbms_output.put_line('년식    가격   입력일   옵션');
	for idx in 1.. arr_carmodel.count loop
		dbms_output.put_line  --데이터를 출력하는 부분
				(arr_carmodel(idx).model||'   '||arr_carmodel(idx).price||'   '||arr_carmodel(idx).hiredate||'   '||arr_carmodel(idx).car_option); 
    end loop;    
    
    dbms_output.put_line('검색 대수 ['||cur_carmodel%rowcount||' ] 대');
		
		else  
			dbms_output.put_line('&model'||'과 같은 모델은 없습니다.');
			
		end if;
			dbms_output.put_line('사용해주셔서 감사여');
		
		close cur_carmodel;
    
end;
/
  				