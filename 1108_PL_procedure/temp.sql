set serveroutput on

declare 
	     temp_deptno number:=55;
begin
	-- �ԷµǴ� �μ���ȣ�� 10 �Ǵ� 20���� ����
	temp_deptno := trunc(temp_deptno/10,0)*10;
	
	if temp_deptno not in (10, 20) then
		temp_deptno := 30;
	end if;	  
	
	dbms_output.put_line( '===='||temp_deptno);

end;
/                           
							
