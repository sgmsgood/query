select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

����
/*1. ��� ���̺��� �����ȣ,�����, ����, ���ʽ��� ��ȸ
   ��, ��� ��ȣ�� �������� ���� ���� �� 3~5������ ���ڵ常 ��� �ϰ�
      ������ 7�ڸ��� ���� ����ϰ� ,�� �־� ����Ѵ�.
      �ش� �ڸ��� ���� ������ 0�� ����Ѵ�. */
select rownum, r_num, empno, ename, to_char(sal,'0,000,000'), comm
from (select rownum r_num, empno, ename, sal, comm
		from emp)
where r_num between 3 and 5
order by empno desc;


/*2. class4_info ���̺��� ��ȣ, �̸� , ����, �¾ �ظ� ��ȸ �ϼ���.
   �¾ �ش� ����⵵-����+1 �� ���մϴ�. */
select num, name, age, to_char(sysdate,'yyyy')-age+1 as birth
from class4_info;



/*3. class4_info ���̺� ��ȣ, �̸� ����, �̸���, �̸����� ��ȿ�� ���θ�
   ��ȸ.
   ��, �̸����� ��ȿ���� '@' �� ������ '��ȿ', '@'�� �����ϸ� '��ȿ'����� */
select * from CLASS4_INFO;
select num, name, age, email, case instr(email,'@') when 0 then '��ȿ' else '��ȿ' end
from class4_info;
where instr(email, '@') >=0;


/*4. car_model ���̺��� �ɼǿ� 'ABS'�� '�����'�� �ִ� ������
    �𵨸�,���,����,�ɼ�, �̹���, �����縦 ��ȸ �ϼ���.
    ��, ������ ������������ �����Ͽ� ����� ��.*/

select * from CAR_MODEL;
select * from CAR_MAKER;
select * from CAR_HOMEWORK;

--create table car_homework as (select model, car_year, price, car_option from car_model);

select model, car_year, price, car_option, car_img, (select maker from car_maker where car_maker.model=car_model.model) maker
from car_model
where instr(car_option,'ABS')<>0 or instr(car_option,'�����')<>0
order by price;

select model, car_year, price, car_option, car_img, (select maker from car_maker where car_maker.model=car_model.model) maker
from car_model
where car_option like '%ABS%' or car_option like '%�����%'
order by price;


/*5. car_model ���̺��� �𵨸��� '�ƹ���', '�ҷ���', 'A8'�� ������
    �𵨸�,�𵨺� ���� ���հ� �Ұ�, �Ѱ踦 ��ȸ �ϼ���.*/
select model, price, sum(price), (select maker from car_maker where car_maker.model=car_model.model) maker
from car_model
where model in('�ƹ���','�ҷ���','A8')
group by rollup(model,price)
order by model;

 select * from CAR_MODEL;

/*6. car_model ���̺��� ���� ������ 1500~3000 ������ ������
   �𵨸�, ���, ����, �ɼ�, �Է���, ���ݺ� ������ ��ȸ�ϼ���.
   ��, ���ݺ� ������ �ߺ����� �ʴ� ��ȣ�� ��µǾ���մϴ�.*/
select model, car_year, price, car_option, hiredate, row_number() over(order by price) rank
from car_model
where price between 1500 and 3000;


/*7. ��� ���̺��� �Ի�⵵�� 1981�� �̻��̸鼭 �Ŵ����� �ִ�  �����
   �����ȣ,�����,����,�Ŵ�����ȣ, ���� ������ ��ȸ �ϼ���.
   ��, ���������� ������ ������ �� ������ ������ �����ݴϴ�.*/
select * from EMP;

select empno, ename, sal, mgr, rank() over(order by sal)
from emp
where to_char(hiredate,'yyyy')>=1981 and mgr is not null;
