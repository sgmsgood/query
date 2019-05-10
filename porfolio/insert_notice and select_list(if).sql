insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('1','admin4478','도대체 포트폴리오가 뭐야?라고 하시는 분들을 위해!','저도 모르겠습니다.. 그래서! 만들어봤슴댜',sysdate,11);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('2','admin4478','각 회사에 맞춤제작된 포트폴리오 형식 제공','이 가능하겠습니까? 좀 날로 드시려고 하시는듯?',sysdate,100);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('3','admin4478','간지나는 포트폴리오를 작성해드립니다.','아마 한 20년 뒤에 나 대신 AI가 일해주는 그 날 가능합니다',sysdate,30);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('4','admin4478','포트폴리오 만들기 시조시조시조새','응 너두? 야 나두 ㅋㅋ',sysdate,50);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('5','admin4478','만들다보니까 쭴 우울','희철이가 싹 다 지워버리라고 하면 우울우울',sysdate,10);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('6','admin4478','좀만 더 만들면 된다','ㅇㅇ 파이팅',sysdate,20);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('7','admin4478','취업하고 싶다고 생각하세요? 포트폴리오도 없이?!!','ㅇㅇ 가능합니다. 굳이 만들 필요없어옄ㅋㅋ 이 회사 나도 없이 들어옴  ',sysdate,80);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('8','admin4478','훌륭한 어그로꾼이 될 수 있는 방법!','개발자를 하세여 개꾸르',sysdate,20);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('9','admin4478','배곱하','영자 일기장',sysdate,100);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('11','admin4478','끼야홋홋홋 다해따잉','낄낄빠빠 ~~~~',sysdate,100);

select * from notice;

	select notice_no, title, inputdate, view_count from
	(select notice_no, title, to_char(inputdate,'yyyy-mm-dd') inputdate, view_count
	from notice



	)
	where notice_no between 1 and 10;

                  	select notice_no, title, inputdate, view_count from
	(select notice_no, title, to_char(inputdate,'yyyy-mm-dd') inputdate, view_count
	from notice
<!-- 	<if test="keyword != null">
		where title like '%'||#{ keyword }||'%' or body like '%'||#{ keyword }||'%'
	</if> -->
	)
	where notice_no between 1 and 10