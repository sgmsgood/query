/*
1.  lucky_pack 패키지에 태어난해를 입력받으면 띠를 반환하는
  함수를 추가하세요.
  띠 - 태어난해를 12로 나눈 나머지가
      11이면 양띠, 10- 말, 9-뱀,8-용,7-토끼,6-호랑이,5-소,4-쥐,3-돼지,
      2-개,1-닭,0-원숭이
*/
var birth varchar2(60);
exec lucky_pack.create_shu(1989);

select lucky_pack.create_shu(1989)
from dual;


