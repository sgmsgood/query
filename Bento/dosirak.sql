select * from ORDERING;

select * from LUNCH;

--��ũĥ��, L_00001, �� �Ǹż��� (4��), 18000

select l.lunch_name , l.lunch_code, o.quan total, o.quan * l.price
from ordering o join lunch l
on o.lunch_code = l.lunch_code;
--group by o.lunch_code;

--����

select l.lunch_name, l.lunch_code, sum(o.quan) total, sum(o.quan)*l.price price
from lunch l, ordering o
where o.lunch_code = l.lunch_code and to_char(o.order_date, 'yyyy-mm-dd')
		= to_char(to_date('2019-1-15','yyyy-mm-dd'),'yyyy-mm-dd')
group by l.lunch_code, l.lunch_name, l.price
order by l.lunch_code ;
