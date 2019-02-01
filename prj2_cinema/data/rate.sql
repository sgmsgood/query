select * from book;
select * from rating;

insert into rating (book_number, movie_rate, review, member_id)
values('NM_000008056', '7',
'개인적으로 이번 작품은 쉴 새없이 몰아치는 유머들로 약간 지치는 감이 없지 않아 있다. 적절한 사운드 활용으로 액션 시에서의 시원함이 배가 된다. 가볍에 즐기기에 좋은 영화이다.','seojin2');

insert into rating (book_number, movie_rate, review, member_id)
values('NM_000008057', 8, '러닝 타임 내내 웃으며 스트레스 날려버릴 수 있는 영화입니다!!
뻔한 코미디 영화일까봐 볼까 말까 고민하시는 분들,
그냥 믿고 보셔도 후회 없으실거라고 생각합니다~!
쬰잼!','jjini83');


update into rating (book_number, movie_rate, review, member_id)
values('NM_000014060', 9, '선에 입각하여 육신의 희노애락에 집착을 벚어 던지면 슬픔과 기쁨을 초월한다.
슬픔도 계속 슬프지 않고 기쁨도 계속 기쁘지 않다. 시간은 흐르고 항상변화하여 다르다.
때문에 슬픔에 집착하지 않고 기쁨에 집착하지 않으면 지금에 충실하게 된다.
영화에서는 이러한 다도의 선사상을 일일시호일의 선문으로서 말한다. 침묵하고 행동하며 느낀다. 다도란 선의 수행이다.','pyramid_top');

commit;

select * from snack_sale;
