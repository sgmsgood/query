/*1. �Ʒ��� ���ǿ� �´� ���̺��� �����ϰ� ������ ��������� �ο��� ��
   ��� �������ǿ� �����ϴ� ��쿡 ���� �����ϴ� ��� �������� �ۼ��ϼ���.

   �μ���ȣ, �����, ����, �̸���, ��ȭ��ȣ, ����, �ּ�, �Ի���, �����ȣ��
   �����ϴ� ���̺��� �����ϼ���.
   <�������>
   - �μ���ȣ�� ���� �� �ڸ��̸�, dept���̺��� deptno�� �Է��� �� �ִ�.
       deptno number(2) constraint fk_deptnum references dept (deptno)

   - ������� �ݵ�� �Է��ؾ��Ѵ�.
       ename varchar2(30) not null

   - ������ �����̰� �� ������ �Է��� �����ϴ�.
     �Է°��� ������ 2400~8000���� �Է°���
       constraint c_sal check (sal between 2400 and 8000)

   - �̸���, ��ȭ��ȣ�� ���� ���� ������ �ִٸ� �����ϴ�.
       constraint uk_mail unique / constraint uk_tell unique

   - ������ ���� �Ǵ� ���ڸ� �Է°����ϴ�.
       gender varchar2(6) constraint c_gender check(gender = '����' or gender = '����')

   - �ּҴ� ���� ���� �ִ�.
      constraint addr unique,

   - �Ի����� ��¥�����̸�, �߰��� �� �Ի����� null�̶�� ���� ��¥�� �ԷµǸ� �ȴ�.
      hiredate date default sysdate

   - �����ȣ�� ���� 4�ڸ��̸�, null�� ������� �ʰ� �ߺ� �����͸� ������ �� ����.
      empno number(4) constraint pk_empno primary key


   - ��� ������Ȳ�� ������Ȳ�� ���� �������� �ۼ��� ��
   - foreign key �ش��ϴ� ��������� ��Ȱ��ȭ ��Ų �� ����  */

   �μ���ȣ, �����, ����, �̸���, ��ȭ��ȣ, ����, �ּ�, �Ի���, �����ȣ��
   �����ϴ� ���̺��� �����ϼ���.

drop table homework_1029;
purge recyclebin;

create table homework_1029(
			empno number(4) constraint pk_empno primary key,
			ename varchar2(30) not null,
			sal number(9) constraint c_sal check (sal between 2400 and 8000),
			email varchar2(50) constraint uk_mail unique,
			tel varchar2(13) constraint uk_tell unique ,
			addr varchar(300),
			hiredate date default sysdate,
			deptno number(2) constraint fk_deptnum references dept (deptno),
			gender varchar2(6) constraint c_gender check(gender = '����' or gender = '����')
);

INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (1111, 'JASPER', 8000, 'JASPER@YAHOO.CO.TW', '010-1234-5678', '��⵵ ������','2008-02-19', 10, '����');

INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (2222, 'ELENA', 5500, 'ELENA@YAHOO.CO.KR', '010-4538-5678', '��⵵ ������','2008-08-20', 10, '����');

COMMIT;


SAVEPOINT A;

INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (324, 'AOSHUFU', 1500, 'AOSHUFU@YAHOO.CO.TW', '010-7868-5678', 'Ÿ�̺��̼� Ÿ�̺��̽�','2016-01-01', 30, '����');

ROLLBACK TO A;
------------------------------------------
INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (32444, 'JJLIN', 6500, 'JJ_LIN@BAIDU.COM', '010-2355-5678', '��⵵ �Ȼ��','2002-03-24', 20, '����');

ALTER TABLE HOMEWORK_1029 MODIFY empno number(5);

INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (32444, 'JJLIN', 6500, 'JJ_LIN@BAIDU.COM', '010-2355-5678', '��⵵ �Ȼ��','2002-03-24', 20, '����');
------------------------------------------



SELECT * FROM HOMEWORK_1029 ;

