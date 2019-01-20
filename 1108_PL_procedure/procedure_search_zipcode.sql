-- ��  �̸��� �Է¹޾� �����ȣ ���̺� �ּ� �˻��ϴ� procedure�� �ۼ��ϼ���
-- �����ȣ�� �������� �������� �� ���� ���� ��ȸ�Ǵ�
-- �����ȣ, �õ�, ����, ��, ������ out parameter�� �Ҵ��ϰ�
-- ��ȸ�� �����ȣ�� �Ǽ��� out parameter�� �Ҵ��� ��

create or replace procedure search_zipcode
		( i_dong varchar2,
		  address out varchar2,
		  search_cnt out number)
is 
	-- 1. ����
	cursor cur_zipcode is
		select zipcode, sido, gugun, dong, nvl(bunji,'��������') bunji
		from  zipcode
		where dong like i_dong||'%' 
		order by zipcode;
		
	type rec_zip is record (
			-- �������� ���̺��.�÷���� ���ٸ� �νĿ� ���� bug��
--			zipcode zipcode.zipcode%type, 
			zip char(7), 
			-- ���� ����� ������ ���̺� ��� ���ٸ� ���̺��� �������� ���ϰ� �� ���� �ִ�.
			
			sido zipcode.sido%type,
			gugun zipcode.gugun%type,
			dong zipcode.dong%type,
			bunji zipcode.bunji%type
			);
			
	 -- ������ �����͸� ������ record ����		
	zip_data rec_zip;
	-- ���� ó�� ���ڵ带 ������ record  ����
	first_data rec_zip;
	
	cnt number := 0;
	
begin 
    -- 2. ����
    if cur_zipcode%isopen then
    	close cur_zipcode;
    end if;
    
    open cur_zipcode;
    
    loop
     	fetch cur_zipcode into zip_data;
     	
     	exit when cur_zipcode%notfound;
     		cnt := cnt +1;
     	
     	if cnt = 1 then
     		first_data := zip_data;
     	end if;
    end loop;
    
     	search_cnt := cur_zipcode%rowcount;
     	
     	if search_cnt !=0 then
     	address := first_data.zip||' '||first_data.sido||' '||first_data.gugun||' '||first_data.dong||' '||first_data.bunji;
     	
     	else
     	     address := i_dong||'�� �������� �ʽ��ϴ�.';
     	end if;
     	
     	--4. Ŀ�� �ݱ�
     		close cur_zipcode;	
     	
    exception
    when invalid_cursor then
    	address := 'Ŀ���� �߸��� ������ ����.';
    when others then
    	address := sqlerrm;
    
    	
end; 
/
