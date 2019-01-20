/*
숙제 .

1.  class4 강의장의 학생들의 교통요금을 구하는  PL/SQL을 제작
   하고자한다.  대중교통수단 요금은 아래와 같으며 
   [버스 : 1200원,  지하철 :1250원] , 10키로를 초과하면 매4키로마다
  100원의 요금 더 부과된다.  
  이 정보를 이용하여 아래 학생들의 데이터를 처리하세요
  데이터. 
 1, 김정운, 서울시 강남구 역삼동, 5키로, 버스
  2, 김희철, 인천시 남동구 구월동, 20키로, 지하철
  3, 이재찬, 인천시 부평구 부평동, 16키로, 지하철
  4, 박영민, 서울시 관악구 봉천동, 10키로, 지하철
  5, 정택성, 서울시 동대문구 동대문동, 8키로, 버스


   출력
   번호, 이름,  주소, 거리, 교통수단, 요금  */
    
-------

set serveroutput on

declare 

	-- 1. 레코드를 선언합니다.
	type tf_record is record (num number,
						name varchar2(9),
						loc varchar2(90),
						dist varchar2(60),
						trf	varchar2(9)
						); 
	
	--2. 테이블을 설정합니다.
	type tf_tab is table of tf_record index by binary_integer;
	
	--3. 변수를 설정합니다.
	tf_info tf_tab;
	
	b_cost number ;
    t_cost number ;
	
begin
 	
 	tf_info(1).num := 1;
 	tf_info(1).name := '김정운';
 	tf_info(1).loc := '서울시 강남구 역삼동';
 	tf_info(1).dist := '5';
 	tf_info(1).trf := '버스';
 	
 	tf_info(2).num := 2;
    tf_info(2).name := '김희철' ;
    tf_info(2).loc := '인천시 남동구 구월동'   ;
    tf_info(2).dist := '20';
    tf_info(2).trf := '지하철';
    
    	tf_info(3).num := 3 ;
    tf_info(3).name := '이재찬';
    tf_info(3).loc :=  '인천시 부평구 부평동';
    tf_info(3).dist :='16';
    tf_info(3).trf :='지하철';

	tf_info(4).num := 4  ;   
    tf_info(4).name := '박영민';
    tf_info(4).loc := '서울시 관악구 봉천동' ;
    tf_info(4).dist :=  '10';
    tf_info(4).trf :='지하철';
                                   
	tf_info(5).num := 5;
    tf_info(5).name := '정택성';
    tf_info(5).loc := '서울시 동대문구 동대문동';
    tf_info(5).dist :='8'  ;
    tf_info(5).trf := '버스'; 

    dbms_output.put_line('번호  이름       주소                       거리   교통수단  기본요금   요금    ');
    dbms_output.put_line('==========================================================================');
    
    
    t_cost := 0;
	b_cost := 0;
	
    for i in 1 .. tf_info.count loop
    
   
    					 
 	if substr(tf_info(i).dist) >10 then 
 			if(tf_info(i).trf = '지하철') then
				t_cost := 1250 + (trunc((tf_info(i).dist-10)/4, 0) * 100);
				b_cost := 1250;
			else
				t_cost := 1200 + (trunc((tf_info(i).dist-10)/4, 0) * 100);
				b_cost := 1200;
			end if;
	else
			if(tf_info(i).trf = '지하철') then
				b_cost := 1250;
				t_cost := b_cost;
			else
				b_cost := 1200;
				t_cost := b_cost;
			end if;
 		
 		
 	end if

    end loop;


end;
/
------------------------------------------     

/*
숙제 2.   
  학생들의 정보를 처리하는 PL/SQL작성.
   번호, 이름, 오라클점수,자바점수,총점,평균 을 저장할 수있는 record를
  만들고 아래의 데이터를 입력한 후 
  반복문을 사용하여  총점,평균을 처리하는 PL/SQL 작성   
 1, 김정운, 80,81
  2, 김희철, 94,80
  3, 이재찬, 97,96
  4, 박영민, 86,92
  5, 정택성, 76,99

 출력 
   번호, 이름, 오라클점수,자바점수,총점,평균 
  .
  .
  .
  자바최고점수 [xx] 오라클 최고점수 [xxx] 
 */
 
 set serveroutput on
 
 declare
 
 	type c_score is record (num number,
						name varchar2(60),
						oracle_score number,
						java_score number);
						
	type st_score is table of c_score index by binary_integer;
						
	
	st st_score; 	
	total_score number; 
	top_oracle number;
	top_java number; 

begin

   st(1).num := 1;
    st(1).name := '김정운';
    st(1).oracle_score := 80;
    st(1).java_score := 81; 
   
   st(2).num := 2;
   st(2).name := '김희철';
   st(2).oracle_score := 94;
   st(2).java_score := 80; 
   
   st(3).num := 3;
   st(3).name := '이재찬';
   st(3).oracle_score := 97;
   st(3).java_score := 96;
   
   st(4).num := 4;
   st(4).name := '박영민';
   st(4).oracle_score := 86;
   st(4).java_score := 92; 
   
   st(5).num := 5;
   st(5).name := '정택성';
   st(5).oracle_score := 76;
   st(5).java_score := 99; 
   
   
   
    dbms_output.put_line('번호   이름   오라클점수  총점  평균');
	dbms_output.put_line('===============================');  
	
	total_score := 0;
	
	top_oracle :=st(1).oracle_score;
	top_java := st(1).java_score;

	for i in 1 .. st.count loop
	  total_score := total_score + st(i).java_score + st(i).oracle_score;
	 
	  
	  dbms_output.put_line(st(i).num||' '||st(i).name||' '|| st(i).oracle_score||' '|| st(i).java_score||
	  						'   '||total_score||'  '||(total_score/2)); 
	   
	  if top_oracle < st(i).oracle_score then
	  	top_oracle :=st(i).oracle_score;
	  end if; 
	  
	    if top_java < st(i).java_score then
	  	top_java :=st(i).java_score;
	  end if;
	   
	end loop;
	dbms_output.put_line('===============================');  
	dbms_output.put_line('자바최고점수 ['||top_java||'] 오라클 최고점수 ['||top_oracle||']');
	-- 자바최고점수 [xx] 오라클 최고점수 [xxx] 
	
 
   
   
   
    
 
end;
/		