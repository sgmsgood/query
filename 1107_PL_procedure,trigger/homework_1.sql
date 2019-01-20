/*
숙제
1. 입사년도를 입력받아 근속년수가 10년 이상이면 '장기근속'
  그렇지 않으면 '단기근속'이라는 메세지를 반환하는 함수 작성.
*/

select empno, ename, hiredate, check_hiredate(hiredate)
from cp_emp2;

select hiredate from emp;

/*
2.  주민번호를 입력받아 성별(남자 -M, 여자-F)을 반환하는 함수 작성.
   성별은 880101-x111111 남자-홀수, 여자 - 짝수
*/



select num, name, ssn, check_ssn(ssn)
from class4_info;



/*
3. 주민번호를 입력받아 출생지역을 반환하는 함수 작성
   출생지역은  880101-1xx1111 에서 xx 두자리 이고
   아래의 표와 같다.
  	서울특별시 : 00~08
	부산광역시 : 09~12
	인천광역시 : 13~15
	경기도 : 16~25
	강원도 : 26~34
	충청도 : 35~47
	전라도 : 48~66
	경상도 : 67~92
	제주특별자치도 : 93~95
*/
select num, name, ssn, check_loc(ssn)
from class4_info;


