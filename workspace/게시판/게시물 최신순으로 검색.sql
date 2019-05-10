select num, subject, writer, e_date, w_date
from
(select rownum r, num, subject, writer, concat(concat(e_year,'-'), concat(concat(e_month,'-') , e_day)) e_date, w_date
from diary
order by num desc
)
where r between 1 and 10;


select * from diary;

-- 총 게시물의 개수
select count(num) from diary;    


