--���� �������� �� �ۺ��� ���۹�ȣ�� �� ��ȣ ������ �Խù� ���ϱ�
select num, subject, writer, e_year, e_month, e_day, w_date
from (select rownum r, num, subject, writer, e_year, e_month, e_day, w_date
	 from (select num, subject, writer, e_year, e_month, e_day, w_date
	 		from diary
	 		order by w_date desc))
where r between 21 and 30;

--���������� rank�Լ� ���
select r_num, num, subject, writer, e_year, e_month, e_day, w_date
from (select num, subject, writer, e_year, e_month, e_day, w_date,
		row_number() over(order by w_date desc) r_num
		from diary)
where r between 21 and 30;



select * from DIARY;
