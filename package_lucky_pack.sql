-- ����� �� (1~45�� �ϳ�) ��� �Լ�


create or replace package lucky_pack
as              

-- ����� �� (1~45�� �ϳ�) ��� �Լ�
	function lucky_num return number;
	
-- ���ξ�� ���ν���
	procedure lucky_name(name out varchar2);	
	
-- �������, ����, ������ �Է¹޾� �ֹι�ȣ�� �����Ͽ�
-- out parameter�� �����ϰ� class4_info ���̺� �߰��ϴ� procedure �ۼ��غ����� 

	procedure create_ssn(birth varchar2, gender varchar2, name varchar2, ssn out char);


--	procedure ssn_maker(ssn out varchar2);
   
--1.  lucky_pack ��Ű���� �¾�ظ� �Է¹����� �츦 ��ȯ�ϴ� �Լ��� �߰��ϼ���.
	function create_shu (birth number) return varchar2;


--
	procedure avr_work(i_deptno number, avr out number);
	
end;
/
	
	

