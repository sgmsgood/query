-- �ڵ带 ������ �ݺ� ��������ִ� loop ���
set serveroutput on 

declare
           i number;

begin
                

		i:=0;							--���ѷ����� ���� ��¾��Ѵ�. ���� ���� �Ⱥ��̴°� ��--	
		loop   
	--	 exit when (i=10);  ������ ���� �־ ����ϴ�--
		dbms_output.put_line('������ �ݿ����� �κ�'||i); 
		
		i := i+1;
		 
		 exit when (i=10);   --if�� ���� �� ������ ����--
--		 if i=10 then
--		exit; 
--		end if;
	end loop;
	dbms_output.put_line('������ �p');
end;
/


