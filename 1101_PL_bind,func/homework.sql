/* 1. 혈액형을 입력받아 혈액형별 특징을 출력 하는 PL/SQL작성.
   -혈액형은 대소문자 모두 비교 가능 해야한다.
   -'A' : 내향적이다. 조심스럽고, 세심하다
   -'B' : 자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.
   -'AB' : 합리적이다. 합리적인 반듯함을 선호하게된다. 
   -'O' :  한결같은 노력과 추진력이 있다. 동료의식이 강하다  */
   
   
set serveroutput on
set verify off

accept BT prompt '혈액형을 입력하세요: '

declare
 	BT char(2) := upper('&BT');

begin  

	if BT in('A','B','O','AB') then
	
			if BT = 'A' then
				 dbms_output.put_line('내향적이다. 조심스럽고, 세심하다.');
		
			elsif BT = 'B' then
				dbms_output.put_line('자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.');
		
			elsif BT = 'O' then
				dbms_output.put_line('한결같은 노력과 추진력이 있다. 동료의식이 강하다.');   
			
			else  
				dbms_output.put_line('합리적이다. 합리적인 반듯함을 선호하게된다.');
			end if; 
	else 
		dbms_output.put_line('자료가 없습니다.');
		
	end if;
end;
/           

/* 2. 점수를 입력받아서  
    100~90 사이면 'A'학점 
     89~80 사이면 'B'
    79~70 사이면 'C'
    69~60 사이면 'D'
    그외 라면 '노력을 요함' 을 출력하는  PL/SQL을 작성하세요 */ 
    
set serveroutput on
set verify off

accept score prompt '점수를 입력하세요: '

declare
	score number := &score;

begin
	if  score between 90 and 100 then
		dbms_output.put_line('A');
	
	elsif score between 80 and 89 then 
	 	dbms_output.put_line('B');
	 	
	elsif score between 70 and 79 then 
		dbms_output.put_line('C');
		
	elsif score between 60 and 69 then 
		dbms_output.put_line('D');	
	
	else       
		dbms_output.put_line('노력을 요함.');
	
	end if;

end;
/   

/* 3. 이름을 입력받아 성과 이름을 출력하는  PL/SQL을 하세요.
    이름의 글자수가 3자 이하라면 '단성'으로 판단하고 4자 이상이라면 
    '복성' 이라고 판단한다.
    단성- 성이 하나인 성 (예: 김,이,오,박),  
    복성 - 성이 두개인성 (예 : 선우용녀, 재갈공명 등)
    출력은  성: 김  이름 : 희철 */

set serveroutput on
set verify off

accept name prompt '이름을 입력하세요.'

declare
	name varchar2(60) := '&name';

begin
	if length (name) <= 3 then
		dbms_output.put_line('성: '||substr(name,1,1)||' 이름: '||substr(name,2));
 	elsif length (name) >= 4 then  
 	    dbms_output.put_line('성: '||substr(name,1,2)||' 이름: '||substr(name,3));
	end if;

end;
/

/*
4. 교통수단을 입력받아, '택시','버스','지하철' 인 경우에만 
  아래와 같은 요금으로 한달 교통비를 산정하세요.
   택시 : 3800 -
   버스 : 1200
   지하철 :1250원
 출력 : 출퇴근에 사용하는 교통수단은 'XX'이고 기본 요금: xx 원입니다.
      왕복요금은 xx원이고, 한달 20일 기준 교통비는 xx원 입니다.
    택시, 버스, 지하철이 아니라면  '대중교통이 아닙니다.' 를 출력하세요.
*/ 

set serveroutput on
set verify off

accept tr prompt ('교통수단을 입력하세요: ')

declare
	tr varchar2(8) := '&tr';
	bus number := 3800;
	taxi number := 1200;
    train number := 1250;

begin 
	if tr in ('택시', '지하철','버스') then
		if tr = '택시' then
		dbms_output.out_line('출퇴근에 사용하는 교통수단은'||tr||'이고 기본 요금: '||taxi||'원 입니다.
							 왕복요금은'||(taxi*2)||'이고 한달 20일 기준 교통비는 '||(taxi*2*20)||'입니다.';
		elsif tr = '버스' then
		dbms_output.out_line('출퇴근에 사용하는 교통수단은'||tr||'이고 기본 요금: '||bus||'원 입니다.
							 왕복요금은'||(bus*2)||'이고 한달 20일 기준 교통비는 '||(bus*2*20)||'입니다.';
		else tr = '지하철' then
		dbms_output.out_line('출퇴근에 사용하는 교통수단은'||tr||'이고 기본 요금: '||train||'원 입니다.
							 왕복요금은'||(train*2)||'이고 한달 20일 기준 교통비는 '||(train*2*20)||'입니다.';
		end if;
    end if;

end;
/