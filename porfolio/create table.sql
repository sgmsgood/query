create table notice (notice_no varchar2(10), admin_no varchar2(10), title varchar2(100), body varchar2(4000), inputdate date, view_count number);

create table admin (admin_id varchar2(10), password varchar2(500), authority varchar2(7), inputdate date, name varchar2(30), isremoved char(1));

create table member(user_id varchar2(20), password varchar2(30), name varchar2(30), birth varchar2(10), phone varchar2(13), inputdate date, isbanned char(1), isdropped char(1));

create table review_board (re_num varchar2(4), user_id varchar2(20), re_contents varchar2(4000), re_title varchar2(60), re_inputdate date, re_cnt number(4));

create table review_comment(re_num varchar2(4), user_id varchar2(20), com_contents varchar2(150), con_inputdate date);
--drop table notice;
