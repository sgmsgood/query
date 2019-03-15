select b.book_number, m.movie_title, b.payment_date,  b.personnel, t.screen_price, to_char(b.movie_start,'yyyymmddhh24miss') movie_start
from  book b, theater t, on_screen os, movie m
where b.screen_num = os.screen_num and os.screen_name = t.screen_name and os.movie_code = m.movie_code
and b.member_id = 'guest';

update member
set hold_point='800000'
where member_id='guest';

select * from member;
select * from book where member_id='guest';

select * from theater;
select * from movie;

--상영시작 시간
select concat(replace(screen_date,'-',''),start_time) start_moment
from on_screen;

delete
from book b, on_screen os
where b.screen_num = os.screen_num
and b.book_number='NM_000021257'
and (concat(replace(os.screen_date,'-',''),os.start_time)) > to_char(sysdate,'yyyymmddhh24mi');

alter

delete
from book
where book_number = 'NM_000020195' ;

pstmt.setString(1, Table.selectedColumn(1);

select * from member;


, MEMBER_ID, HOLD_POINTselect * from movie where movie_code = substr('NM_000020195',2,8);

alter table member modify hold_point number(9);    


insert into member (member_id, password, name, birthdate, phone, membership, hold_point, acc_point, input_date)
select 'guest123', '1234','게스트','19900219', '010-4511-1111', 's','0','0', sysdate
from dual
where not exists (select * from member where phone = '010-0011-1111');

commit;
