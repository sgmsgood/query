--DDL
create table namecard(
name varchar2(30) not null, addr varchar2(100) not null, img varchar2(255) default 'no_image.png',
input_date date default sysdate);

--�� �����͸� �߰�
insert into namecard(name,addr,img)values('������','����� ������ ���ﵿ Ȳ��','no_image.png');

insert into namecard(name,addr,img)values('������','����� ������ �������� ��Ȳ��','no_image.png');

insert into namecard(name,addr,img)values('������','��⵵ �Ⱦ�� ���̵� 3����','no_image.png');

commit;

select * from NAMECARD;

