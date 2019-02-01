create or repalce function book_code
return char 
is

begin 
	return concat(lpad(seq_book.nextval,3,0));