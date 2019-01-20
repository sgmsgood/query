<delete>
-- 테이블에 모드 레코드를 삭제하거나, 조건에 맞는 특정 레코드를 
-- 삭제할 때 사용하는 쿼리

-- 1) 모든 레코드를 지울 때

delete from class4_info;

-- 2) 특정 레코드만 삭제
-- 학생의 번호가 11번인 학생의 레코드를 삭제할거임

/*
delete from class4_info
where num = 11;
*/

-- truncate는 테이블의 레코드를 절삭한다.
-- 자른 것은 다시 붙을 수 없음

/*
truncate table class4_info;
*/

-- 필요없는 테이블 삭제
-- 삭제 된 테이블은 Oracle10g 부터 휴지통으로 이동한다.

drop table class4_info;

-- 휴지통 보기: sqlplus
-- show recyclebin (; 안써도 됨)
-- 휴지통 비우기: sqlplus
-- purge recyclebin
-- 휴지통 테이블 복구: sqlplus
-- flashback table 원본테이블명 to before drop