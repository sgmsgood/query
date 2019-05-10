select notice_no, title, inputdate, view_count
	from
	(select notice_no, title, to_char(inputdate,'yyyy-mm-dd') inputdate, view_count
	from notice

	)
	where notice_no between 11 and 20
	ORDER BY LENGTH(notice_no) desc, notice_no desc;


		select notice_no, title, to_char(inputdate,'yyyy-mm-dd') inputdate, view_count from
	(select notice_no, title, inputdate, view_count, row_number() over(order by inputdate desc) r_num
	from notice)
	where r_num between 1 and 241;
                                                                        
select view_count from notice
where ;

update notice
set view_count = (select view_count from notice where notice_no=#{notice_no})+1
where notice_no=#{notice_no}
