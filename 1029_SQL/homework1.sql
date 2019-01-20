/*1. 아래의 조건에 맞는 테이블을 생성하고 적절한 제약사항을 부여한 후
   모든 제약조건에 성공하는 경우에 따라 실패하는 모든 쿼리문을 작성하세요.

   부서번호, 사원명, 연봉, 이메일, 전화번호, 성별, 주소, 입사일, 사원번호를
   저장하는 테이블을 생성하세요.
   <제약사항>
   - 부서번호는 숫자 두 자리이며, dept테이블의 deptno만 입력할 수 있다.
       deptno number(2) constraint fk_deptnum references dept (deptno)

   - 사원명은 반드시 입력해야한다.
       ename varchar2(30) not null

   - 연봉은 숫자이고 억 단위의 입력이 가능하다.
     입력가능 연봉은 2400~8000까지 입력가능
       constraint c_sal check (sal between 2400 and 8000)

   - 이메일, 전화번호는 없을 수도 있지만 있다면 유일하다.
       constraint uk_mail unique / constraint uk_tell unique

   - 성별은 남자 또는 여자만 입력가능하다.
       gender varchar2(6) constraint c_gender check(gender = '남자' or gender = '여자')

   - 주소는 없을 수도 있다.
      constraint addr unique,

   - 입사일은 날짜형식이며, 추가할 때 입사일이 null이라면 현재 날짜가 입력되면 된다.
      hiredate date default sysdate

   - 사원번호는 숫자 4자리이며, null을 허용하지 않고 중복 데이터를 저장할 수 없다.
      empno number(4) constraint pk_empno primary key


   - 모든 에러상황과 성공상황에 대해 쿼리문을 작성한 후
   - foreign key 해당하는 제약사항을 비활성화 시킨 후 삭제  */

   부서번호, 사원명, 연봉, 이메일, 전화번호, 성별, 주소, 입사일, 사원번호를
   저장하는 테이블을 생성하세요.

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
			gender varchar2(6) constraint c_gender check(gender = '남자' or gender = '여자')
);

INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (1111, 'JASPER', 8000, 'JASPER@YAHOO.CO.TW', '010-1234-5678', '경기도 성남시','2008-02-19', 10, '남자');

INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (2222, 'ELENA', 5500, 'ELENA@YAHOO.CO.KR', '010-4538-5678', '경기도 성남시','2008-08-20', 10, '여자');

COMMIT;


SAVEPOINT A;

INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (324, 'AOSHUFU', 1500, 'AOSHUFU@YAHOO.CO.TW', '010-7868-5678', '타이베이성 타이베이시','2016-01-01', 30, '여자');

ROLLBACK TO A;
------------------------------------------
INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (32444, 'JJLIN', 6500, 'JJ_LIN@BAIDU.COM', '010-2355-5678', '경기도 안산시','2002-03-24', 20, '남자');

ALTER TABLE HOMEWORK_1029 MODIFY empno number(5);

INSERT INTO HOMEWORK_1029 (EMPNO, ENAME, SAL, EMAIL, TEL, ADDR, HIREDATE, DEPTNO, GENDER)
VALUES (32444, 'JJLIN', 6500, 'JJ_LIN@BAIDU.COM', '010-2355-5678', '경기도 안산시','2002-03-24', 20, '남자');
------------------------------------------



SELECT * FROM HOMEWORK_1029 ;

