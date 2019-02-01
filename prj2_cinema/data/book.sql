
-- to_date('1994-03-11 15:03:11', 'yyyy-mm-dd hh24:mi:ss')


insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000008',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-22 11:20:45','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'harvard17','N_1901291650');


insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000008',trim(to_char(seq_book.nextval,'000'))),3,to_date('2019-01-23 15:15:15','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'seojin2','N_1901291650');

insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000008',trim(to_char(seq_book.nextval,'000'))),1,to_date('2019-01-22 08:29:15','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'jjini83','N_1901291650');


insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000008',trim(to_char(seq_book.nextval,'000'))),1,to_date('2019-01-28 19:35:55','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 16:50','yyyy-mm-dd hh24:mi'),'pyramid_top','N_1901291650');

commit;



insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000014',trim(to_char(seq_book.nextval,'000'))),7,to_date('2019-01-24 20:20:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'mamasang','N_1901301140');


(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000014',trim(to_char(seq_book.nextval,'000'))),3,to_date('2019-01-26 16:35:56','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'pyramid_top','N_1901301140');



insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000014',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-29 12:20:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'doctor_seul','N_1901301140');



insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000014',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-23 18:35:35','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-30 11:40','yyyy-mm-dd hh24:mi'),'','N_1901301140');

commit;

rollback;


select * from book;
-------------------------------------------------------------------------------------------------------------------------------------
insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000013',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-24 09:07:05','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 08:30','yyyy-mm-dd hh24:mi'),'stealjam','P_1901290830');


insert into book
(book_number, personnel, payment_date, movie_start, member_id, screen_num)
values(concat('NM_000013',trim(to_char(seq_book.nextval,'000'))),2,to_date('2019-01-22 07:45:05','yyyy-mm-dd hh24:mi:ss'),to_date('2019-01-29 08:30','yyyy-mm-dd hh24:mi'),'','P_1901290830');

commit;
