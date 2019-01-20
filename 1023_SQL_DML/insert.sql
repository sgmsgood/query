-- 테이블에 레코드(row) 추가

-- 1) 컬럼명은 생략하는 경우 <단, 순서를 명확히 숙지>


insert into class4_info values(1, '류이호', '860812-1168745', 33, 1.4, 'jasperryu@sist.co.kr', sysdate);

commit;

insert into class4_info values(2, '860812-2268745', '임의신', 33, 1.4, 'jasperryu@sist.co.kr', sysdate);

commit;


-- 2) 컬럼을 명시하여 추가

insert into class4_info (num, name, ssn, age, eye, mail, input_date)
	values(3, '900219-2268745', 'elen', 29, 0.7, 'elena00@sist.co.kr', sysdate);

-- 3) 컬럼의 정의 순서는 테이블의 정의된 컬럼의 순서와 관련없음

insert into class4_info (name, num, mail, ssn, age, input_date, eye)
	values('임준걸', 4, 'jjlin@naver.com', '860101-1154574', 34, sysdate, 0.8);

commit;




-- 4) 컬럼을 생략하면 null이 입력된다.
insert into class4_info(num, name, age)
values(5, '곽설부', 29);

commit;

--하나로 끝나또
  select * from CLASS4_INFO
