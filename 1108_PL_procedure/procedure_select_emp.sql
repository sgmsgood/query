-- �μ���ȣ�� �Է¹޾� emp���̺��� �μ��� �����ȣ�� 
-- ��ȸ�Ͽ� out parameter�� �����ϴ� procedure
-- ��ȸ: �����ȣ, �����, ����, �μ���ȣ, �μ���, ��ġ 
-- 10~19�� �ԷµǸ� 10�� ����
-- 20~29�� �ԷµǸ� 20�� 
-- �� �ܴ� ��� 30�� 

create or replace procedure select_emp
		(deptno number,
		 cur_join out sys_refcursor)
is     
	temp_deptno number := deptno;
	
begin
	-- �ԷµǴ� �μ���ȣ�� 10 �Ǵ� 20���� ����
	temp_deptno := trunc(temp_deptno/10,0)*10;
	
	if temp_deptno not in (10, 20) then
		temp_deptno := 30;
	end if;	  
	
	-- refcursor ����
	open cur_join for
		select  e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
		from  dept d, emp e
		where (e.deptno = d.deptno) 
		and d.deptno = temp_deptno;
	

end;
                           
							
