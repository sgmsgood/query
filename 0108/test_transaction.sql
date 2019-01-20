create table test_transaction1 (subject varchar2(60),
writer varchar2(15), input_date date default sysdate);

create table test_transaction2 (subject varchar2(30),
writer varchar2(15), input_date date default sysdate);

select * from TEST_TRANSACTION1
