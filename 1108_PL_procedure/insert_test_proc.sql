-- �����ȣ, �����, ����, ����(job)�� �Է¹޾� test_proc�� �߰��ϴ� procedure�� �ۼ��ϼ���.
-- �����ȣ�� 1~9999 ������ ���� �ԷµǾ�� �մϴ�.

-- ������  2500~8000���̸� �ԷµǾ� ��.
-- 2500���϶�� 2500����, 8000 �̻��̶�� 8000���� �����Ͽ� ���
-- ������ ���, ����, �븮, ����, ����, ����, �̻縸 �ԷµǾ��� ������ �߰���

-- ������� ������ ��� ù �ڸ� �빮�ڷ� �����Ͽ� �߰�
-- �ߺ��� �����ȣ�� �ԷµǸ� ���ܷ� ó���Ѵ�.

create or replace procedure insert_test_proc(
		empno number,
		ename varchar2,
		sal number,
		job varchar2,
		msg out varchar2,
		row_cnt out number)

is

    temp_sal number := sal;

begin

-- ������� 1.

	if empno between 1 and 9999 then
-- ������� 2.
		if temp_sal < 2500 then
		   temp_sal := 2500;
		   end if;

		if temp_sal > 8000 then
			temp_sal := 8000;
		 end if;
-- ������� 3.
		if  job in ('���', '����', '�븮', '����', '����', '����') then

		    insert into test_proc(empno,ename, hiredate, sal, job)
		    values(empno, initcap(ename), sysdate, temp_sal, job);

		    row_cnt := sql%rowcount;

		    commit;

		    msg:= empno||'�� ��� ������ �߰��Ǿ����ϴ�.';

		else
			msg:= job||'�� �Է°����� ������ �ƴմϴ�.';
		end if;

	else
		msg := empno||'�����ȣ�� 1~9999 ���̸� �Է°���';

	end if;

		exception
		when dup_val_on_index then
			msg := empno||'�� �����ȣ�� �̹� �����մϴ�.';   
			row_cnt:=0;
		when others then
--			msg := '���ܹ߻�'||sqlerrm||'/'||sqlcode;
			if sqlcode = -12899 then
			 msg := ename||'���� �ѱ� 3�� ���� 10�ڸ� �ʰ��Ͽ����ϴ�.';  
			 row_cnt:=0;
			end if;

end;
/
