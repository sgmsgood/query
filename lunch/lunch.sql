/* ������ */
DROP TABLE lunch_admin
	CASCADE CONSTRAINTS;

/* ���ö� */
DROP TABLE lunch
	CASCADE CONSTRAINTS;

/* �ֹ� */
DROP TABLE Ordering
	CASCADE CONSTRAINTS;

-----------------DDL for table lunch_admin-----------------
/* ������ */
CREATE TABLE lunch_admin (
	id VARCHAR2(20) NOT NULL, /* ���̵� */
	pass VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	name VARCHAR2(30) NOT NULL, /* �̸� */
	input_date DATE DEFAULT sysdate /* �Է��� */
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
/* ���ö� */
CREATE TABLE lunch (
	lunch_code CHAR(8) NOT NULL, /* ���ö��ڵ� */
	lunch_name VARCHAR2(60) NOT NULL, /* ���ö��� */
	img VARCHAR2(90) NOT NULL, /* �̹��� */
	price NUMBER(5) NOT NULL, /* �ܰ� */
	spec VARCHAR2(4000) NOT NULL, /* Ư¡ */
	input_date date DEFAULT sysdate, /* �Է��� */
	id VARCHAR2(20) /* ���̵� */
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
/* �ֹ� */
CREATE TABLE Ordering (
	order_num CHAR(12) NOT NULL, /* �ֹ���ȣ */
	quan NUMBER(10) NOT NULL, /* ���� */
	order_name VARCHAR2(30) NOT NULL, /* �ֹ��ڸ� */
	phone VARCHAR2(13) NOT NULL, /* ��ȭ��ȣ */
	ip_address VARCHAR2(15) NOT NULL, /* �ֹ�ip */
	order_date DATE DEFAULT sysdate, /* �ֹ����� */
	status CHAR(1) DEFAULT 'N', /* �������� */
	lunch_code CHAR(8) /* ���ö��ڵ� */
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


