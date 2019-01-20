/*
����
1. ��� ���̺��� �����ȣ,�����, ����, ���ʽ��� ��ȸ
   ��, ��� ��ȣ�� �������� ���� ���� �� // 3~5������ ���ڵ常 ��� �ϰ�
      ������ 7�ڸ��� ���� ����ϰ� ,�� �־� ����Ѵ�.
      �ش� �ڸ��� ���� ������ 0�� ����Ѵ�.
*/
select r, empno, ename, to_char(sal,'0,000,000') sal, comm
from (select rownum r, empno, ename, sal, comm
		from (select empno, ename, sal, comm
				from  emp
				order by empno desc))
where r between 3 and 5;

/*
2. class4_info ���̺��� ��ȣ, �̸� , ����, �¾ �ظ� ��ȸ �ϼ���.
   �¾ �ش� ����⵵-����+1 �� ���մϴ�.

*/

select num, name, age, to_char(sysdate,'yyyy')-age+1
from class4_info;

/*
3. class4_info ���̺� ��ȣ, �̸� ����, �̸���, �̸����� ��ȿ�� ���θ�
   ��ȸ.
   ��, �̸����� ��ȿ���� '@' �� ������ '��ȿ', '@'�� �����ϸ� '��ȿ'�����
*/
select*from class4_info;

select num, name, age, mail, decode(instr(mail,'@'),0,'��ȿ','��ȿ')
from class4_info
where mail is not null;


/*
4. car_model ���̺��� �ɼǿ� 'ABS'�� '�����'�� �ִ� ������
    �𵨸�,���,����,�ɼ�, �̹���, �����縦 ��ȸ �ϼ���.
    ��, ������ ������������ �����Ͽ� ����� ��.
*/
select model,car_year, price, car_option, car_img
from (select model, car_year, price, car_option
		from car_model
        where substr(car_model,)

from (select price
		from car_model
		order by price);

select*from car_model;
/*
5. car_model ���̺��� �𵨸��� '�ƹ���', '�ҷ���', 'A8'�� ������
    �𵨸�,�𵨺� ���� ���հ� �Ѱ踦 ��ȸ �ϼ���.
*/
select model, price, total, sum...
from car_model
where model like '�ƹ���'or model like'�ҷ���'or model like'A8'
group by (model);
/*
6. car_model ���̺��� ���� ������ 1500~3000 ������ ������
   �𵨸�, ���, ����, �ɼ�, �Է���, ���ݺ� ������ ��ȸ�ϼ���.
   ��, ���ݺ� ������ �ߺ����� �ʴ� ��ȣ�� ��µǾ���մϴ�.

7. ��� ���̺��� �Ի�⵵�� 1981�� �̻��̸鼭 �Ŵ����� �ִ�  �����
   �����ȣ,�����,����,�Ŵ�����ȣ, ���� ������ ��ȸ �ϼ���.
   ��, ���������� ������ ������ �� ������ ������ �����ݴϴ�.

