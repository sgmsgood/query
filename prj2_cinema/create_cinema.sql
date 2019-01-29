/* ������ ���� */
DROP TABLE admin
	CASCADE CONSTRAINTS;

/* ��ȭ */
DROP TABLE movie
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE book
	CASCADE CONSTRAINTS;

/* ȸ�� */
DROP TABLE member
	CASCADE CONSTRAINTS;

/* �󿵰� */
DROP TABLE theater
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE snack
	CASCADE CONSTRAINTS;

/* �� */
DROP TABLE rating
	CASCADE CONSTRAINTS;

/* �����Ǹ����� */
DROP TABLE snack_sale
	CASCADE CONSTRAINTS;

/* �� */
DROP TABLE on_screen
	CASCADE CONSTRAINTS;

/* ���Ĵٵ� �¼� */
DROP TABLE standard_seat
	CASCADE CONSTRAINTS;

/* �����̾� �¼� */
DROP TABLE primium_seat
	CASCADE CONSTRAINTS;

/* ������ ���� */
CREATE TABLE admin (
	admin_id VARCHAR2(30) NOT NULL, /* ������ ���̵� */
	name VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	password VARCHAR2(30) NOT NULL, /* �̸� */
	hiredate date DEFAULT sysdate NOT NULL /* �Ի��� */
);

ALTER TABLE admin
	ADD
		CONSTRAINT PK_admin
		PRIMARY KEY (
			admin_id
		);

/* ��ȭ */
CREATE TABLE movie (
	movie_code CHAR(8) NOT NULL, /* ��ȭ�ڵ� */
	movie_title VARCHAR2(100) NOT NULL, /* ��ȭ ���� */
	movie_img VARCHAR2(30) NOT NULL, /* ��ȭ ������ */
	genre VARCHAR2(30) NOT NULL, /* �帣 */
	country VARCHAR2(20) NOT NULL, /* ���۱��� */
	director VARCHAR2(50) NOT NULL, /* ���� */
	movie_grade CHAR(2) NOT NULL, /* ��ȭ ��� */
	runningtime NUMBER(3) NOT NULL, /* ����Ÿ�� */
	playdate VARCHAR2(8) NOT NULL, /* ������ */
	synopsis VARCHAR2(700) NOT NULL, /* �ٰŸ� */
	actor VARCHAR2(50) NOT NULL, /* �⿬�� */
	movie_date DATE DEFAULT sysdate NOT NULL, /* ��ȭ ����� */
	admin_id VARCHAR2(30) NOT NULL /* ������ ���̵� */
);

ALTER TABLE movie
	ADD
		CONSTRAINT PK_movie
		PRIMARY KEY (
			movie_code
		);

/* ���� */
CREATE TABLE book (
	book_number CHAR(12) NOT NULL, /* ���Ź�ȣ */
	personnel NUMBER(2) NOT NULL, /* �ο� */
	payment_date DATE NOT NULL, /* �����Ͻ� */
	movie_start DATE NOT NULL, /* ��ȭ���Ͻ� */
	member_id VARCHAR2(30) NOT NULL, /* ȸ�� ���̵� */
	screen_num CHAR(12) NOT NULL /* �󿵹�ȣ */
);

ALTER TABLE book
	ADD
		CONSTRAINT PK_book
		PRIMARY KEY (
			book_number
		);

/* ȸ�� */
CREATE TABLE member (
	member_id VARCHAR2(30) NOT NULL, /* ȸ�� ���̵� */
	password VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	name VARCHAR2(30) NOT NULL, /* �̸� */
	birthdate VARCHAR2(8) NOT NULL, /* ������� */
	phone VARCHAR2(13) NOT NULL, /* �޴�����ȣ */
	membership CHAR(1) NOT NULL, /* ȸ����� */
	hold_point NUMBER(6), /* ���� ����Ʈ */
	acc_point NUMBER(6), /* ���� ����Ʈ */
	input_date DATE DEFAULT sysdate NOT NULL /* ȸ�������� */
);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			member_id
		);

/* �󿵰� */
CREATE TABLE theater (
	screen_name CHAR(1) NOT NULL, /* �󿵰� �̸� */
	screen_price NUMBER(5) NOT NULL, /* ���� */
	seat_count NUMBER(2) NOT NULL /* �� �¼��� */
);

ALTER TABLE theater
	ADD
		CONSTRAINT PK_theater
		PRIMARY KEY (
			screen_name
		);

/* ���� */
CREATE TABLE snack (
	snack_name VARCHAR2(20) NOT NULL, /* ������ */
	snack_price NUMBER(5) NOT NULL, /* ���� */
	snack_img VARCHAR2(30) NOT NULL, /* �̹��� */
	snack_info VARCHAR2(600), /* �������� */
	snack_date DATE NOT NULL /* �����߰��� */
);

ALTER TABLE snack
	ADD
		CONSTRAINT PK_snack
		PRIMARY KEY (
			snack_name
		);

/* �� */
CREATE TABLE rating (
	book_number CHAR(12) NOT NULL, /* ���Ź�ȣ */
	movie_rate NUMBER(2) NOT NULL, /* ���� */
	review VARCHAR2(600), /* �򰡳��� */
	member_id VARCHAR2(30) NOT NULL /* ȸ�� ���̵� */
);

ALTER TABLE rating
	ADD
		CONSTRAINT PK_rating
		PRIMARY KEY (
			book_number
		);

/* �����Ǹ����� */
CREATE TABLE snack_sale (
	snack_order_num CHAR(12) NOT NULL, /* �����ֹ���ȣ */
	quan NUMBER(2) NOT NULL, /* ���� */
	exchange CHAR(1) NOT NULL, /* ��ȯ���� */
	snack_name VARCHAR2(20) NOT NULL, /* ������ */
	member_id VARCHAR2(30) NOT NULL /* ȸ�� ���̵� */
);

ALTER TABLE snack_sale
	ADD
		CONSTRAINT PK_snack_sale
		PRIMARY KEY (
			snack_order_num
		);

/* �� */
CREATE TABLE on_screen (
	screen_num CHAR(12) NOT NULL, /* �󿵹�ȣ */
	screen_date VARCHAR2(8) NOT NULL, /* �󿵳�¥ */
	start_time VARCHAR2(4) NOT NULL, /* �� ���۽ð� */
	end_time VARCHAR2(4) NOT NULL, /* �� ����ð� */
	movie_code CHAR(8) NOT NULL, /* ��ȭ�ڵ� */
	screen_name CHAR(1) NOT NULL /* �󿵰� �̸� */
);

ALTER TABLE on_screen
	ADD
		CONSTRAINT PK_on_screen
		PRIMARY KEY (
			screen_num
		);

/* ���Ĵٵ� �¼� */
CREATE TABLE standard_seat (
	seat_num NUMBER(2) NOT NULL, /* �¼���ȣ */
	book_number CHAR(12) NOT NULL /* ���Ź�ȣ */
);

ALTER TABLE standard_seat
	ADD
		CONSTRAINT PK_standard_seat
		PRIMARY KEY (
			seat_num
		);

/* �����̾� �¼� */
CREATE TABLE primium_seat (
	seat_num NUMBER(2) NOT NULL, /* �¼���ȣ */
	book_number CHAR(12) NOT NULL /* ���Ź�ȣ */
);

ALTER TABLE primium_seat
	ADD
		CONSTRAINT PK_primium_seat
		PRIMARY KEY (
			seat_num
		);

ALTER TABLE movie
	ADD
		CONSTRAINT FK_admin_TO_movie
		FOREIGN KEY (
			admin_id
		)
		REFERENCES admin (
			admin_id
		);

ALTER TABLE book
	ADD
		CONSTRAINT FK_member_TO_book
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE book
	ADD
		CONSTRAINT FK_on_screen_TO_book
		FOREIGN KEY (
			screen_num
		)
		REFERENCES on_screen (
			screen_num
		);

ALTER TABLE rating
	ADD
		CONSTRAINT FK_book_TO_rating
		FOREIGN KEY (
			book_number
		)
		REFERENCES book (
			book_number
		);

ALTER TABLE rating
	ADD
		CONSTRAINT FK_member_TO_rating
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE snack_sale
	ADD
		CONSTRAINT FK_snack_TO_snack_sale
		FOREIGN KEY (
			snack_name
		)
		REFERENCES snack (
			snack_name
		);

ALTER TABLE snack_sale
	ADD
		CONSTRAINT FK_member_TO_snack_sale
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);

ALTER TABLE on_screen
	ADD
		CONSTRAINT FK_movie_TO_on_screen
		FOREIGN KEY (
			movie_code
		)
		REFERENCES movie (
			movie_code
		);

ALTER TABLE on_screen
	ADD
		CONSTRAINT FK_theater_TO_on_screen
		FOREIGN KEY (
			screen_name
		)
		REFERENCES theater (
			screen_name
		);

ALTER TABLE standard_seat
	ADD
		CONSTRAINT FK_book_TO_standard_seat
		FOREIGN KEY (
			book_number
		)
		REFERENCES book (
			book_number
		);

ALTER TABLE primium_seat
	ADD
		CONSTRAINT FK_book_TO_primium_seat
		FOREIGN KEY (
			book_number
		)
		REFERENCES book (
			book_number
		);
, SNACK_NAME