/* 이름, 나이를 입력받아 ref_tab 테이블을 참조하여 생성한 변수(record 변수: 테이블을 참조해서 변수를 만들어라)에 값을 입력한 후
	아래와 같이 출력하는 PL/SQL을 생성하세요.
	출력) 이름: xxxx님, 나이: xx살
		(작년 나이: xx살, 내년나이: xx살) */

set serveroutput on 
set verify off   


accept name prompt '이름:';  
accept age prompt '나이:';

declare 
	input_data ref_tab%rowtype;  --> ref_tab에 보면 데이터가 있으니까 그거랑 같이 묶여서 다녀(rowtype)
	--> 변수명       테이블명%테이블 모든 컬럼 참조	
								 --> 정보를 묶어서보기 각각 쓸꺼면 (name ref_tab.name%type)
 	
begin  
 	input_data.name := '&name';
 	input_data.age := &age;

    dbms_output.put_line('이름:'||input_data.name||'님, 나이: '||input_data.age||'살');  
    dbms_output.put_line('작년나이: '||(input_data.age-1)||'살, 내년나이:'||(input_data.age+1)||'살 입니다.');

end;
/