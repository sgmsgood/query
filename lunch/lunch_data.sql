-----------------Data for table lunch_admin-----------------
insert into lunch_admin(ID, PASS,NAME)
values('admin','1234','������');
insert into lunch_admin(ID,PASS,NAME)
values('lunch','1234','����ȣ');
insert into lunch_admin(ID,PASS,NAME)
values('root','1234','�����');
commit;
-----------------Data for table lunch-----------------
insert into lunch(LUNCH_CODE,LUNCH_NAME,IMG,PRICE,SPEC,ID)
values(lunch_code,'��ũĥ��','m1_l1.gif',4500,'����� ������ ���������� ȯ���� ��������
 �پ��� ���� ������ �� �ִ� �κ� ������.','admin');

insert into lunch(LUNCH_CODE,LUNCH_NAME,IMG,PRICE,SPEC,ID)
values(lunch_code,'���','m1_l2.gif',3800,'�ٻ�Ƣ�ܳ� Ƣ��ʾȿ� ������ ��⸦ ���� �����
�������� ����Ե�  ��� ������ȭ�� �κ� ������. �ҽ����� �����ݴϴ�','admin');

commit;

select * from lunch;
-----------------Data for table ordering-----------------
insert into ordering (ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code,1,'������','010-3456-4567','211.63.89.132','L_000001');

insert into ordering (ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code,3,'������','010-5436-2455','211.63.89.157','L_000001');

insert into ordering (ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code,1,'������','010-5646-8786','211.63.89.135','L_000002');

commit;

