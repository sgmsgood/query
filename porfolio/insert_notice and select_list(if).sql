insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('1','admin4478','����ü ��Ʈ�������� ����?��� �Ͻô� �е��� ����!','���� �𸣰ڽ��ϴ�.. �׷���! �����ý���',sysdate,11);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('2','admin4478','�� ȸ�翡 �������۵� ��Ʈ������ ���� ����','�� �����ϰڽ��ϱ�? �� ���� ��÷��� �Ͻôµ�?',sysdate,100);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('3','admin4478','�������� ��Ʈ�������� �ۼ��ص帳�ϴ�.','�Ƹ� �� 20�� �ڿ� �� ��� AI�� �����ִ� �� �� �����մϴ�',sysdate,30);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('4','admin4478','��Ʈ������ ����� ��������������','�� �ʵ�? �� ���� ����',sysdate,50);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('5','admin4478','����ٺ��ϱ� �H ���','��ö�̰� �� �� ����������� �ϸ� �����',sysdate,10);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('6','admin4478','���� �� ����� �ȴ�','���� ������',sysdate,20);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('7','admin4478','����ϰ� �ʹٰ� �����ϼ���? ��Ʈ�������� ����?!!','���� �����մϴ�. ���� ���� �ʿ������� �� ȸ�� ���� ���� ����  ',sysdate,80);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('8','admin4478','�Ǹ��� ��׷β��� �� �� �ִ� ���!','�����ڸ� �ϼ��� ���ٸ�',sysdate,20);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('9','admin4478','�����','���� �ϱ���',sysdate,100);

insert into notice (notice_no, admin_id, title, body, inputdate, view_count)
values('11','admin4478','����ȪȪȪ ���ص���','�������� ~~~~',sysdate,100);

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