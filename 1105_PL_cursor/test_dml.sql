-- �̰� �غ��� �ͽ��ϴ�. �����ȣ, �����, �μ���ȣ, ����, ������ �Է¹޾� cp_emp3 ���̺�
-- �߰��ϴ� PL/SQL�ۼ�
-- ��, ����� ������ �μ���ȣ�� ���� ���� �������� �߰��մϴ�.
-- 10�� �μ�: emp���̺� �����ȣ�� 7566�� ����� ���� ����
-- 20�� �μ�: emp ���̺� �����ȣ�� 7698
-- 30�� �μ�: emp ���̺� �����ȣ�� 7782
-- �� �� �μ���ȣ�� �ԷµǸ� 7788����� �������� �߰��϶���

set serveroutput on
set verify off

accept empno prompt '�����ȣ: '
accept ename prompt '�����̸�: '
accept deptno prompt '�μ���ȣ: '
accept job prompt '����: '


declare
	empno cp_emp3.empno%type := &empno;
    ename cp_emp3.ename%type := '&ename';
    deptno cp_emp3.deptno%type := &deptno;
    job cp_emp3.job%type := '&job';
 

	sal cp_emp.sal%type;
	select_empno cp_emp.empno%type := 7788;
begin
	-- �ԷµǴ� �μ���ȣ���� ������ ������ ��ȸ�ϱ� ���� �����ȣ�� ����
	if deptno = 10 then
		select_empno := 7566;
		
	elsif deptno = 20 then
	    select_empno := 7698;
	    
	elsif deptno = 30 then
		select_empno := 7782;
    
    else
        select_empno := 7788;
        
    end if;           
    
    -- ������ �����ȣ���� ������ ��ȸ
    select sal
    into   sal
    from   emp
    where  empno = select_empno;
    
    -- ��ȸ�� �������� �߰� �۾�
    insert into cp_emp3(empno, ename, deptno, job, sal)
    	values (empno, ename, deptno, job, sal);
   
    dbms_output.put_line(empno||'�� ��� ������ �߰��Ͽ����ϴ�.');	
    commit;
    
  

end;
/
