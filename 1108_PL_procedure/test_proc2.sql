var cur_dept refcursor;

exec select_all_dept (:cur_dept);

print cur_dept;

-- �μ���ȣ �Է��Ͽ� �μ��� ��� ���� ��ȸ
var cur_emp refcursor;
-- �μ���ȣ :10, 20, 30
exec select_emp(11,:cur_emp);

print cur_emp;
