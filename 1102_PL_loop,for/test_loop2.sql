-- 1 ~ 100���� ����ϴ� loop

set serveroutput on

declare
       cnt number(3); 

begin
     
     -- �ʱⰪ
         cnt :=1;                                  		--������ 1�̶� �ʱⰪ2�� �Ҽ� ����--
          --1���� ���� 100���� (¦���� ���)
         
                                                       --������ ���°� ������ put���� ����ϰ�
     loop   
          if mod(cnt,2)=0 then   
         dbms_output.put_line( cnt||'' );  
         end if;                --�̷������� �޾��ָ� �ȴ�.
         cnt := cnt+1;
         exit when cnt=101;                              	
	end loop;
	 -- endloop; �ؿ� dbms_output.put_line('��');     
end;
/
