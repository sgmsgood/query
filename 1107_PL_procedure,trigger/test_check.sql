select*from user_procedures;

drop function plus;

-- �ֹι�ȣ�� ��ȿ�� ����

select  check_ssn('880101-123456'),
        check_ssn('88010-1123456'),
        check_ssn('880101-1233456'),
        check_ssn('8801011123456')
from 	dual;

select * from CLASS4_INFO;

update class4_info
set    ssn = '8801011234567'
where  num = 7;
s
commit;

-- class4_info ���̺��� ��ȣ, �̸�, �ֹι�ȣ
-- �ֹι�ȣ�� ���� üũ�Ͽ� ��� ���ڵ带 ��ȸ�ϼ���.

select num, name, ssn, check_ssn(ssn)
from class4_info;

select * from user_procedures
where object_type like 'P%';

var num number;
exec proc_plus(11,11,:num);
print num


select * from cp_emp2;
var insert_msg varchar2(30);
execute proc_insert_cpemp2(1111,'������', 3000, :num,:insert_msg);
print insert_msg;

print num;
