-- 행운의 수 (1~45중 하나) 얻는 함수


create or replace package body lucky_pack
as              

-- 행운의 수 (1~45중 하나) 얻는 함수   
----------------------------lucky_num 시작
	function lucky_num return number
	is
	begin
	    return trunc(dbms_random.value(1,46));
	end lucky_num;
----------------------------lucky_num 끝  
---------------------------- lucky_name 시작

 	procedure lucky_name (name out varchar2)
	is 
		type name_tab is table of varchar2(30)
			index by binary_integer;
		
		name_arr name_tab;
		
		temp_num number;
		
	begin
		name_arr(1) := '류이호';
		name_arr(2) := '임의신';
		name_arr(3) := '임준걸';
		name_arr(4) := '정원창';
		name_arr(5) := '명경루';
		name_arr(6) := '최혜원';	
		name_arr(7) := '이재찬';
		
		temp_num := trunc(dbms_random.value(1,name_arr.count+1));
		
		name := name_arr(temp_num);
											
	end lucky_name;	

---------------------------- lucky_name 끝
---------------------------- ssn_maker 시작     



 -----  create_ssn 시작 -----  
		procedure create_ssn(birth varchar2, gender varchar2,
		name varchar2, ssn out char)     
		is
		--주민번호를 저장할   테이블
			type ssn_tab is table of number(1)
				index by binary_integer;
			
			ssn_arr ssn_tab;	
			gender_num number :=2;
			temp_num number := 0;
			flag_num number :=2; 
			temp_ssn varchar2(5);
		    ssn_value varchar2(14);
		begin                  
			-- 입력받은 생년월일을 ssn_tab추가
			for i in 1 .. length(birth) loop
				ssn_arr(i) := substr(birth,i,1);
			end loop;                                
			
			-- 성별 채우기 1       
			if gender ='남자' then  
				gender_num := 1;
			end if;
			
		
			
			ssn_arr(7) := gender_num;
			--나머지 번째 방 값을 채운다.
			--880101123456x
			for i in 8 .. 12 loop
				ssn_arr(i) := trunc(dbms_random.value(0,10),0);
			end loop;   
			-- 생성된 주민번호를 가지고 끝자리를 채우기 위한 연산
			for i in 1 .. ssn_arr.count loop
			   temp_num := temp_num + ssn_arr(i)* flag_num;
			   
			   flag_num := flag_num+1;
			   
			   if flag_num = 10 then
			   	flag_num :=2;
			   	end if;
			end loop;  
			
			--채워진값으로 끝 자리를 설정
			ssn_arr(13) := mod(11-mod(temp_num,11),10);
			
			ssn_value := birth||'-'||gender_num||ssn_arr(8)|| ssn_arr(9)||
			ssn_arr(10)||ssn_arr(11)||ssn_arr(12)||ssn_arr(13);
		
		
	        -----  create_ssn 끝 ----- 
	        ----- 생성된 주민번호를 class4_info에 추가
	        insert into class4_info(name, ssn)
	        values (name, ssn_value);
	        
	        ssn:=ssn_value;   
	        
	        
	        
	      end	create_ssn;  
	        
	        
	        	
--	function ssn_maker (ssn varchar2) 
--	return varchar2
--	is
--	
--	birth prompt '생년월일: '
-- 	gender prompt '성별: '
--	
--	declare          
--	
--	 type rec_ssn 
--	 	(birth date,
--	 	gender varchar2);			
--	
--		gender_num number;
--		ssn_num number;
--
--	
--	begin
--	
--    	if gender = '남자' then
--    		gender_num := 1;
--    	else
--    		gender_num := 2;
--    	end if; 
--    
--    dbms_output.put_line (to_char(birth,'yy-mm-dd')||'-'||gender_num);
--
--    
-- 	end ssn_maker;
---------------------------- ssn_maker 끝     
 
/*
1.  lucky_pack 패키지에 태어난해를 입력받으면 띠를 반환하는 
  함수를 추가하세요.
  띠 - 태어난해를 12로 나눈 나머지가 
      11이면 양띠, 10- 말, 9-뱀,8-용,7-토끼,6-호랑이,5-소,4-쥐,3-돼지,
      2-개,1-닭,0-원숭이
*/  
---------------------------- create_shu 시작    

	function create_shu (birth number) return varchar2
    is 
    	
    	
     	shu_arr varchar2(60);
     	
     	temp_arr number:= 0;
     
    
     	
     	begin
     	
     	temp_arr := mod(birth,12); 
     	
    	 	
        
        if temp_arr = 0 then
        	shu_arr := '원숭이';
        elsif temp_arr=1 then
			shu_arr := '닭';  
		elsif temp_arr=2 then
			shu_arr := '개';
		elsif  temp_arr=3 then
			shu_arr :=	'돼지';
		elsif temp_arr=4 then
			shu_arr := '쥐';
		elsif  temp_arr=5 then
			shu_arr := '소';
		elsif  temp_arr=6 then
			shu_arr := '호랑이';		
		elsif  temp_arr=7 then
			shu_arr := '토끼';	   	 
     	elsif  temp_arr=8 then
			shu_arr := '용';  
     	elsif temp_arr=9 then
			shu_arr := '뱀';
		elsif  temp_arr=10 then
			shu_arr := '말';
		elsif  temp_arr=11 then
			shu_arr := '양';
		else shu_arr := '사람임?';
	
		end if; 

     	return  shu_arr;     
     	
     	
   end create_shu;  
   
   
/*
2. lucky_pack 패키지에 부서번호를 받아 emp 테이블에서 부서별
   사원의 평균 근속년수를 out_parameter에 설정하는 procedure를
   추가하세요.
*/
	procedure avr_work (i_deptno number,
							avr out number)
	is
		cnt_p number (10) := 0;
		sum_y number (10) := 0;
	
	begin 
	
		select count(empno), sum(to_char(sysdate, 'yyyy') - to_char(hiredate,'yyyy')) 
		into   cnt_p, sum_y
		from  emp
		where deptno = i_deptno;
    
		avr := 0;
		
		avr := trunc(sum_y / cnt_p);	

	end avr_work;


end;
/
	
	

