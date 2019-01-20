/* ����

1. ��ⷮ�� 1500~3000 ������ ������ ������, ������, �𵨸�, ���, ����, �̹���, �Է���, �ɼ�, ��ⷮ�� ��ȸ.
	-��, ����� ��ⷮ�� �������� �������� �� 3~6��° ���ڵ常 ��ȸ�ϰ�,
		�ɼ��� ó�� ','������ ����� ��. ���ݰ� ������ 3�ڸ����� ','�� �־ ���.
		�Է����� ��-��-���� �������� ����� ��. */
select r, country, maker, model, to_char(car_year,'9,999') car_year, to_char(price,'9,999') price, car_img, to_char(hiredate,'mm-dd-yyyy') hiredate, substr(car_option,1,instr(car_option,',')), cc
from (select rownum r, country, maker, model, car_year, price, car_img, hiredate, car_option, cc
	           from (select  cc.country, cc.maker, cmo.model, cmo.car_year, cmo.price, cmo.car_img, cmo.hiredate, cmo.car_option, cmo.cc
		               from   car_model cmo, car_maker cma, car_country cc
	                    where (cma.maker = cc.maker and cma.model = cmo.model) and cc between 1500 and 3000
	                   order by cc desc))
where R between 3 and 6;



select * from CAR_MODEL;


/*
2. �μ���ȣ�� 10�� 30, 40���� ��� �μ��� �����ȣ, �����, �Ի���, ����, ��������, �μ���, �μ���ȣ, ��ġ, �����ȣ, �õ�, ����, ��, ������ ��ȸ.
	- ��, ����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ���,
		�����ȣ�� '-'�ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü�Ͽ� ���, �Ի����� ��-��-�� ���ϱ��� ���
*/
select r, empno, ename, to_char(hiredate,'mm-dd-yyyy day'), sal, dname, deptno, loc, substr(zipcode,instr(zipcode,'-')+1) zipcode, sido, gugun, dong, nvl(bunji, '��������')
from (select rownum r, empno, ename, hiredate, sal, dname, deptno, loc, zipcode, sido, gugun, dong, bunji
		from (select e.empno,e.ename, e.hiredate, e.sal, d.dname, d.deptno, d.loc, z.zipcode, z.sido, z.gugun, z.dong, z.bunji
				from  emp e, dept d, zipcode z
				where (e.deptno(+) = d.deptno and z.seq(+)= e.empno )
				 and d.deptno in (10, 30, 40))

		)
where r between 2 and 5;




select * from dept;
/*
3. ������ �����簡 '����','���','�Ｚ', 'BMW', 'Audi'�̰�
   �ɼ� o�� 'ABS','TCS'�� �ִ� ������ ������, ������, �𵨸�, ����, ����, �ɼ�, �̹���, ��ⷮ ��ȸ.
   -��, ������ �������� �����ϰ�, ������ ���ٸ� ������ ������������ �����Ͽ� ���, �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ����� ��.
	   ��������� ������ Bmw, Audi�� �������� ���.

*/

select cc.country, initcap(cc.maker), cmo.model, cmo.car_year, cmo.price, cmo.car_option,
		substr(cmo.car_img,1,instr(cmo.car_img,'.')-1) img_name, substr(cmo.car_img,instr(cmo.car_img,'.')+1), cmo.cc
from  car_country cc, car_maker cma, car_model cmo
where  (cma.maker = cc.maker and cmo.model = cma.model)
		and cc.maker in ('����','���','�Ｚ', 'BMW', 'Audi')
--		and (instr(car_option,'ABS')>0 or instr(car_option,'TCS')>0)
		and car_option like '%ABS%' or car_option like '%TCS%'
order by cmo.car_year desc, cmo.price desc;


select  cc.country, initcap(cc.maker), cma.model, cmo.car_year, cmo.price, cmo.car_option ,
		substr(cmo.car_img,1,instr(cmo.car_img,'.')-1) as img_name ,substr(cmo.car_img,instr(cmo.car_img,'.')+1) as Ȯ����, cmo.cc
from   	CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo
where   (cma.maker  = cc.maker and cmo.model = cma.model)
		and cc.maker in ('����', '���', '�Ｚ', 'BMW', 'AUDI')
		and (instr(car_option, 'ABS') > 0 or instr(car_option, 'TCS') > 0 )
order by cmo.car_year desc, cmo.price desc;

select country, initcap(maker), model, car_year, price, car_option,
		substr(car_img,1,instr(car_img,'.')-1) img_name1, substr(car_img,instr(car_img,'.')+1) ext1, cmo.cc
		from (select country, maker, model, car_year, price, car_option, car_img, cc
		from(select cc.country, cma.maker, cmo.model, cmo.car_year, cmo.price, cmo.car_option, cmo.car_img, cmo.cc
				from car_maker cma, car_model cmo, car_country cc
				where ((cma.model = cmo.model and cma. maker = cc.maker) and cma.maker in ('����', '���','�Ｚ','BMW', 'AUDI'))
						and (instr(car_option,'TCS')>0 or instr(car_option,'ABS')>0))
order by car_year desc, price desc;



select * from CAR_MODEL;

/* 4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ �𵨸�, ������,
  ������,����,������ �Ʒ��� ���� ������ �������� ���.
  ��, ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,
   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�,
   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.
*/
select r, '['|| model||'] ������ ������ ['|| country|| maker, price, car_year
from (select rownum r, model, country, maker, price, car_year
				from (select cmo.model, cc.country, cma.maker, cmo.price, cmo.car_year
						from car_model cmo, car_maker cma, car_country cc
						where (cmo.model = cma.model and cma.maker = cc.maker)
							and cmo.model in('K5','�ƹ���', '�ҷ���','A8','SM3')
							order by price))
where r between 2 and 7;

select r, '['||model||'] ������ ������ ['||car_year||'] �̰�, �������� ['||country||'] �̸�, ['
		|| maker||']�簡 �������Դϴ�. ������ ['|| to_char(price,'9,999')||',000]�� �Դϴ�.'
from (select rownum r, model, country, maker, price, car_year
				from (select cmo.model, cc.country, cma.maker, cmo.price, cmo.car_year
						from car_country cc, car_maker cma, car_model cmo
						where (cc.maker = cma.maker and cma.model = cmo.model)
								and cmo.model in ('K5','�ƹ���', '�ҷ���','A8','SM3')
								order by cmo.price))
where r between 2 and 7;

/* 5. �����簡 '����'�� ������ ���, �𵨸�, <���ĺ� �� ������ ��ȸ.  ??>*/

select cmo.car_year, cmo.model, sum(cmo.price)
from  car_maker cma, car_model cmo
where (cma.model = cmo.model) and cma.maker = '����'
group by cmo.car_year, rollup(cmo.model);


/*
   6. ������� 'S'�� �����ų� �̸�5���̸鼭 ����° ���ڰ� 'A'��
	  �����ȣ, �����, �Ի���, ����, ����, �� ���ɾ�, �����λ��, �μ���ȣ, �μ���, ��ġ, �����ȣ, �õ�, ����, ��, ���� ��ȸ
	  - ��, �Ǽ��ɾ��� ����+������+���ʽ� - ����(���� 3.3)�� ���
	  		�����λ���� �μ���ȣ�� ���� ���� �λ�
	  	10�� �μ� - ���� 7%, 20 - ���� 4%, 30- (����+���ʽ�)+10%, �� �� 3%�� ����Ͽ� 3�ڸ�����, ,�� �־� ����ϼ���.
	  - ��� ����� �ҹ��ڷ� ���
*/
select e.empno, lower(e.ename), e.hiredate, e.sal, e.sal * 0.033 tax,
		-- to_char(e.sal + (e.sal/12) + nvl(e.comm,0) - (e.sal * 0.033),'9,999') �Ǽ��ɾ�,
	trunc(e.sal + (e.sal/12) + nvl(e.comm,0) - (e.sal * 0.033),0)
		case e.empno
			when 10 then to_char((e.sal * 0.07),'9,999')
			when 20 then to_char((e.sal * 0.07),'9,999')
			when 30 then to_char((e.sal+nvl(comm,0) * 0.07),'9,999')
			else to_char((e.sal * 0.03),'9,999')
		end �����λ��
		, d.deptno, lower(d.dname), lower(d.loc), z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.deptno = d.deptno and z.seq = e.empno)
		and  e.ename like '%S' and e.ename like '__A__';

--e.ename'%S' => S�� ������ ���� ã�� �� ����   e.ename like '%S' and e.ename like '__A__'

select*from emp

