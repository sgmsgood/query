-- ���̺� ���ڵ�(row) �߰�

-- 1) �÷����� �����ϴ� ��� <��, ������ ��Ȯ�� ����>


insert into class4_info values(1, '����ȣ', '860812-1168745', 33, 1.4, 'jasperryu@sist.co.kr', sysdate);

commit;

insert into class4_info values(2, '860812-2268745', '���ǽ�', 33, 1.4, 'jasperryu@sist.co.kr', sysdate);

commit;


-- 2) �÷��� ����Ͽ� �߰�

insert into class4_info (num, name, ssn, age, eye, mail, input_date)
	values(3, '900219-2268745', 'elen', 29, 0.7, 'elena00@sist.co.kr', sysdate);

-- 3) �÷��� ���� ������ ���̺��� ���ǵ� �÷��� ������ ���þ���

insert into class4_info (name, num, mail, ssn, age, input_date, eye)
	values('���ذ�', 4, 'jjlin@naver.com', '860101-1154574', 34, sysdate, 0.8);

commit;




-- 4) �÷��� �����ϸ� null�� �Էµȴ�.
insert into class4_info(num, name, age)
values(5, '������', 29);

commit;

--�ϳ��� ������
  select * from CLASS4_INFO
