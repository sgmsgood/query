< update >
-- ���ǿ� �´� ���ڵ带 ã�� �÷��� ���� �����ϴ� ��
-- class4_info ���̺��� �л��� ��ȣ�� "2"�� �л��� ã�Ƽ� �̸��� '����ö'�� �����Ͻÿ�.

/*
update class4_info
set       name = 'elen'
where  num = 2;
*/

commit;

--�л��� ��ȣ�� 10���� �л��� ã�Ƽ� �̸��� '����â', ���� 22, �̸��� lee@daum.net, �Է��� '���糯¥'

update class4_info
set	name = '����â', age = 22, mail = 'lee@daum.net', input_date=sysdate
where	num = 10;

commit;

-- �л��� ��ȣ�� 10���̸鼭 �̸��� '�ڿ���'�� �л��� �ֹι�ȣ�� 
-- '880101-7894561'�� �����ϼ���.

update class4_info
set  	ssn = '880101-7894561'
where	num = 11 or name  = '����â';

commit;

update class4_info
set 	ssn = '900219-2268745', name = 'elen'
where 	num = 3;