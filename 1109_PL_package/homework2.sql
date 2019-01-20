/*
2. lucky_pack 패키지에 부서번호를 받아 emp 테이블에서 부서별
   사원의 평균 근속년수를 out_parameter에 설정하는 procedure를
   추가하세요.
*/

var avr_y number(10);
exec lucky_pack.avr_work(10,:avr_y);
print avr_y;

