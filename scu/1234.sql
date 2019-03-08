select * from theater;
select * from standard_seat;
select * from member;
select * from book;
select * from ON_SCREEN;

/*번호, 예매번호, 예매수, 결제일시, 총가격, 환불가능여부*/

select b.book_number, b.personnel, b.payment_date, to_char(b.movie_start,'yyyy-mm-dd hh24:mm') movie_start, t.screen_price*b.personnel total_price, to_char(sysdate,'yyyy-mm-dd hh24:mm') today
from   book b, theater t, on_screen os
where b.screen_num = os.screen_num and os.screen_name = t.screen_name and b.member_id = 'harvard17';
---40000원: screen_num:P_1901291300
select *
from book
where book_number='NM_000021114';

select b.book_number, b.payment_date, to_char(b.movie_start,'yyyy-mm-dd hh24:mm') movie_start, b.personnel, t.screen_price
from  book b, theater t, on_screen os
where b.screen_num = os.screen_num and os.screen_name = t.screen_name;


select * from book;
select * from rating where book_number='NM_000019120';

select * from PREMIUM_SEAT where book_number='NM_000019188';
select * from book where book_number='NM_000017121';

----------------------------------------------------------------지우는 순서
delete from rating where book_number='NM_000021114';
delete from standard_SEAT where book_number='NM_000021115';
delete from book where book_number='NM_000021115';

-------------------------------------------------------------------
select * from member where member_id='guest';
update member set hold_point='900000' where member_id='guest';



commit;

select * from snack_sale where member_id='guest';

