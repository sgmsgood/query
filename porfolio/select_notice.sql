select notice_no, title, inputdate, view_count from
	(select notice_no, title, to_char(inputdate,'yyyy-mm-dd') inputdate, view_count
	from notice)
	where notice_no between 1 and 11;

SELECT notice_no,title,body,TO_CHAR(inputdate,'YYYY-MM-DD') inputdate
	FROM notice
	where notice_no=10;

select * from notice;
