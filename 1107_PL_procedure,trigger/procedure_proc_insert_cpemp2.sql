-- cp_emp2 ���̺� �����ȣ, �����, �Ի���, ������ �߰��ϴ� procedure�ۼ��϶���
-- �߰� �� ���� ���� �ܺη� ��ȯ�ϴ� procedure�� ��������.


create or replace procedure proc_insert_cpemp2(
	empno in cp_emp2.empno%type, 
	ename cp_emp2.ename%type,
	sal cp_emp2.sal%type, cnt out number, msg out varchar2)
is

begin
 		insert into cp_emp2(empno, ename, hiredate, sal)
 		values (empno, ename, sysdate, sal);
 		
 		cnt := sql%rowcount; 
 		msg := '�߰�����';   
 		commit;

 		
 		exception
 		when others then
 			cnt := 0;   
 			msg := '�߰�����';
 			
 		
end;
/
 
-- 1. bind �������� : var ������ number

-- 2. ���ν��� ����: exec proc_insert_cpemp2 (�����ȣ, �����, ����, : ������)

-- 3. bind ���� �� ���: print ������ 
