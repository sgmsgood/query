/* ��ȭ�ڵ� 'M_000001'�� ��ȯ�ϴ� �Լ� */
create or replace function movie_code
return char
is

begin
	return concat('M_', lpad(seq_movie.nextval,6,0));
end;
/