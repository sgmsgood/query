/*
1.  lucky_pack ��Ű���� �¾�ظ� �Է¹����� �츦 ��ȯ�ϴ�
  �Լ��� �߰��ϼ���.
  �� - �¾�ظ� 12�� ���� ��������
      11�̸� ���, 10- ��, 9-��,8-��,7-�䳢,6-ȣ����,5-��,4-��,3-����,
      2-��,1-��,0-������
*/
var birth varchar2(60);
exec lucky_pack.create_shu(1989);

select lucky_pack.create_shu(1989)
from dual;


