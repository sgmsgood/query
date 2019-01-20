/* 관리자 */
DROP TABLE lunch_admin
	CASCADE CONSTRAINTS;

/* 도시락 */
DROP TABLE lunch
	CASCADE CONSTRAINTS;

/* 주문 */
DROP TABLE Ordering
	CASCADE CONSTRAINTS;

-----------------DDL for table lunch_admin-----------------
/* 관리자 */
CREATE TABLE lunch_admin (
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	pass VARCHAR2(20) NOT NULL, /* 비밀번호 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	input_date DATE DEFAULT sysdate /* 입력일 */
);

CREATE UNIQUE INDEX PK_lunch_admin
	ON lunch_admin (
		id ASC
	);

ALTER TABLE lunch_admin
	ADD
		CONSTRAINT PK_lunch_admin
		PRIMARY KEY (
			id
		);

-----------------DDL for table lunch-----------------
/* 도시락 */
CREATE TABLE lunch (
	lunch_code CHAR(8) NOT NULL, /* 도시락코드 */
	lunch_name VARCHAR2(60) NOT NULL, /* 도시락명 */
	img VARCHAR2(90) NOT NULL, /* 이미지 */
	price NUMBER(5) NOT NULL, /* 단가 */
	spec VARCHAR2(4000) NOT NULL, /* 특징 */
	input_date date DEFAULT sysdate, /* 입력일 */
	id VARCHAR2(20) /* 아이디 */
);



CREATE UNIQUE INDEX PK_lunch
	ON lunch (
		lunch_code ASC
	);

ALTER TABLE lunch
	ADD
		CONSTRAINT PK_lunch
		PRIMARY KEY (
			lunch_code
		);
-----------------DDL for table ordering-----------------
/* 주문 */
CREATE TABLE Ordering (
	order_num CHAR(12) NOT NULL, /* 주문번호 */
	quan NUMBER(10) NOT NULL, /* 수량 */
	order_name VARCHAR2(30) NOT NULL, /* 주문자명 */
	phone VARCHAR2(13) NOT NULL, /* 전화번호 */
	ip_address VARCHAR2(15) NOT NULL, /* 주문ip */
	order_date DATE DEFAULT sysdate, /* 주문일자 */
	status CHAR(1) DEFAULT 'N', /* 제적상태 */
	lunch_code CHAR(8) /* 도시락코드 */
);

CREATE UNIQUE INDEX PK_Ordering
	ON Ordering (
		order_num ASC
	);

ALTER TABLE Ordering
	ADD
		CONSTRAINT PK_Ordering
		PRIMARY KEY (
			order_num
		);

ALTER TABLE lunch
	ADD
		CONSTRAINT FK_lunch_id
		FOREIGN KEY (
			id
		)
		REFERENCES lunch_admin (
			id
		);

ALTER TABLE Ordering
	ADD
		CONSTRAINT FK_lunch_Ordering
		FOREIGN KEY (
			lunch_code
		)
		REFERENCES lunch (
			lunch_code
		);


