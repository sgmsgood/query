select * from user_procedures;
-- �ܺκ��� ����
var msg varchar2(300);
var cnt number;

-- ���� �̿��� ���� �Է�
execute update_test_proc(1112,'����',3000, :cnt, :msg);
-- ó�� ��� ���
print msg;
print cnt;


select * from test_proc;

-- �������
execute update_test_proc(1115,'����',2490,:cnt,:msg);
-- ó�� ��� ���
print msg;
print cnt;

-- ���ν��� ����
execute update_test_proc(1112,'����',3000, :cnt, :msg);
-- ó�� ��� ���
print msg;
print cnt;

-- ����: �����ϴ� �����ȣ�� ����, �������� �ʴ� �����ȣ�ε� ����
exec delete_test_proc(1111,:msg, :cnt);

print msg;
print cnt;

-- ��ȸ: ���޿� ���� �����, ������ ��ȸ
var sal number;
exec select_test_proc_cnt('�븮�콺',:msg,:cnt,:sal);

print msg;
print cnt;
print sal;

select*from test_proc;

-- �� �̸����� �����ȣ �˻�
var msg1 varchar2(300);
exec search_zipcode('�󵵵�', :msg, :cnt);

print msg;
print cnt;


-- sys_refcursor�� ���
var cur_dept refcursor;

-- sys_refcursor�� ����
exec select_all_dept(:cur_dept);

-- ���
print cur_dept;
