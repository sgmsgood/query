select*from DIARY;
create table diary_reply(
  num number,
  num_ref number,
  writer varchar2(30),
  content varchar2(600),
  input_date date,
  constraint pk_diary_reply primary key(num),
  constraint fk_num_ref foreign key(num_ref)
  	references diary(num)
);

---------------------------------------------------���� �������� �޸� �� ã��
select*from Diary
order by num desc;

create sequence seq_reply
increment by 1
start with 1
maxvalue 99999999;

insert into diary_reply(num,num_ref,writer,content,input_date)
values(seq_reply.nextval, 41,'������','����....',sysdate);

insert into diary_reply(num,num_ref,writer,content,input_date)
values(seq_reply.nextval, 41,'����ȣ','�ֵζ����?',sysdate);

commit;
