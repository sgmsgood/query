-- �� ���� �Է¹޾� ���ϱ� ������ ����� out parameter�� 
-- �����ϴ� procedure�� ������� �ҰԿ�!

create or replace procedure proc_plus(num1 number,
										num2 in number,
										num3 out number)
is 
    -- parameter ��� ���� ������ �ۼ��� �� ����.
    -- num1 varchar2(30);
    -- �������� ������ ������ ���ν������ �ٸ��� �����Ѵ�.
begin
    -- in parameter���� ���� �Ҵ��� �� ����.
	-- num1 := 100;
	-- out parameter���� �� �Ҵ��� �ȴ�.
	
	num3 := num1 + num2;
end;

-- 1. �ҽ� �ۼ�

-- 2. ������               

--3. ���ε� ���� ���� : var val_number

--4. ����: exec proc_plus(11,7,:val)

--5. ���ε庯���� ���� ���: print val

