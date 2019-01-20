-- 행운의 수 (1~45중 하나) 얻는 함수


create or replace package lucky_pack
as              

-- 행운의 수 (1~45중 하나) 얻는 함수
	function lucky_num return number;
	
-- 귀인얻기 프로시저
	procedure lucky_name(name out varchar2);	
	
-- 생년월일, 성별, 지역을 입력받아 주민번호를 생성하여
-- out parameter에 설정하고 class4_info 테이블에 추가하는 procedure 작성해보때여 

	procedure create_ssn(birth varchar2, gender varchar2, name varchar2, ssn out char);


--	procedure ssn_maker(ssn out varchar2);
   
--1.  lucky_pack 패키지에 태어난해를 입력받으면 띠를 반환하는 함수를 추가하세요.
	function create_shu (birth number) return varchar2;

end;
/
	
	

