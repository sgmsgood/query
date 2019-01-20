
select * from CAR_MODEL;
select * from CAR_MAKER;
select * from CAR_COUNTRY;

update car_model
set		car_img='qm5_001.jpg'
where   car_img='qm5_001.jpg,qm5_002.jpg';

update car_model
set		car_img='qm5_003.jpg'
where   car_img='qm5_003.jpg,qm5_004.jpg';

update car_model
set		car_img='qm5_005.jpg'
where   car_img='qm5_005.jpg,qm5_006.jpg';
commit;


     /*
����
1. ��ⷮ�� 1500~3000 ������ ������
	������ ������ �𵨸� ��� ���� �̹��� �Է��� �ɼ�, ��ⷮ�� ��ȸ
	��, ����� ��ⷮ�� �������� ���������� 3~6��° ���ڵ常 ��ȸ�ϰ�
	�ɼ��� ó�� ','������ ����� ��.
	���ݰ� ������ 3�ڸ����� ,�� �־� ���
	�Է����� ��-��-���� �������� ��� �� ��.
	*/

select country, maker, model, to_char(car_year, '9,999'),
				to_char(price, '9,999'), car_img, to_char(hiredate,'mm-dd-yyyy'),
				substr(car_option,1,instr(car_option,',')), cc
from(select rownum num, country, maker, model, car_year,
					price, car_img, hiredate, car_option, cc
	from( select  cc.country, cc.maker, cma.model, cmo.car_year,
					cmo.price, cmo.car_img, cmo.hiredate, cmo.car_option, cmo.cc
			from   	CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo
			where   (cma.maker  = cc.maker and cmo.model = cma.model)
				and cmo.cc between 1500 and 3000
			order by cmo.cc desc))
where num between 3 and 6;
/*
2. �μ���ȣ�� 10��, 30,40���� ��� �μ���
	�����ȣ,�����,�Ի���,����,��������,�μ���,�μ���ȣ,��ġ,�����ȣ,�õ�,����,��,������ ��ȸ
	��, ����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ����� ��
	�����ȣ�� '-'�ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü�Ͽ� ���
	 �Ի����� ��-��-�� ���ϱ��� ���
*/
select * from ZIPCODE;

select empno, ename, to_char(hiredate,'mm-dd-yyyy'), sal, deptno, row_number() over( order by sal asc) as sal_rank,
	dname, loc,
    substr(zipcode,instr(zipcode,'-'))zipcode,
    sido, gugun, dong, nvl(bunji,'��������')
from(select rownum num, empno, ename, hiredate, sal, deptno,
			dname, loc,
		    zipcode, sido, gugun, dong, bunji
	from(select e.empno, e.ename, e.hiredate, e.sal, e.deptno,
				d.dname, d.loc,
			    z.zipcode, z.sido, z.gugun, z.dong, z.bunji
		from emp e, dept d, zipcode z
		where (e.deptno(+) = d.deptno and z.seq = e.empno)
			and (e.deptno = 10 or e.deptno = 30 or e.deptno = 40)
		order by e.empno))
where num between 2 and 5;


/*
3. ������ �����簡 '����','���','�Ｚ','BMW','AUDI'�̰� �ɼǿ� 'ABS','TCS'��
 �ִ� ������  ������, ������,�𵨸�, ����,����, �ɼ�, �̹���, ��ⷮ ��ȸ
  --��, ������ �������� �����ϰ�, ������ ���ٸ� ������ ������������ �����Ͽ� ���,
   �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ����Ұ�,
   ��������� ������ Bmw, Audi �� �������� ��� .
*/
select  cc.country, initcap(cc.maker), cma.model, cmo.car_year,
		cmo.price, cmo.car_option ,substr(cmo.car_img,1,instr(cmo.car_img,'.')-1) as img_name ,substr(cmo.car_img,instr(cmo.car_img,'.')+1) as Ȯ����, cmo.cc
from   	CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo
where   (cma.maker  = cc.maker and cmo.model = cma.model)
		and cma.maker in ('����', '���', '�Ｚ', 'BMW', 'AUDI')
		and (instr(car_option, 'ABS') > 0 or instr(car_option, '�����') > 0 )
order by cmo.car_year desc, cmo.price desc;

/*
4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ �𵨸�, ������,
  ������,����,������ �Ʒ��� ���� ������ �������� ���.
  ��, ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,
   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�,
   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.
*/
select	'[' || model || '] ������ ������ [' || car_year || ']�̰�, �������� [' || country || ']�̸�, [' || maker || ']�簡 �������Դϴ�. ������ [' || to_char(price, '9,999') || ',000' || '] �� �Դϴ�.' as result
from(select  rownum num, model, country, maker, price, car_year
	from(select  cma.model, cc.country, cc.maker, cmo.price, cmo.car_year
		from   	CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo
		where   (cma.maker  = cc.maker and cmo.model = cma.model)
				and cmo.model in ('K5', '�ƹ���', '�ҷ���', 'A8', 'SM3')
		order by cmo.price))
where num between 2 and 7;

/*
5. �����簡 '����'�� ������ ���, �𵨸�, ���ĺ� �Ѱ����� ��ȸ.
*/
select cmo.car_year, cmo.model, sum(cmo.price)
from car_maker cma, car_model cmo
where (cmo.model = cma.model) and cma.maker = '����'
group by rollup(cmo.car_year, cmo.model);


/*
6. ������� 'S'�� �����ų� �̸�5���̸鼭 ����° ���ڰ� 'A'��
   �����  �����ȣ, �����, �Ի���,����,����, �Ǽ��ɾ�, �����λ��,
   �μ���ȣ,�μ���,��ġ,�����ȣ,�õ�, ����,��,���� �� ��ȸ
   ��,�Ǽ��ɾ��� ����+������+���ʽ�-����(���� 3.3) �� ���
     �����λ���� �μ���ȣ�� ���� ���� �λ�
     10- ��� 7%, 20- ��� 4%, 30- ���+���ʽ� 10%, �׿� 3%��
     ����Ͽ� 3�ڸ����� ,�� �־� ���.
     ��� ����� �ҹ��ڷ� ���.
*/

select e.empno, lower(e.ename), e.hiredate, to_char(e.sal, '9,999'),
	e.sal * 0.033 as ����, to_char(e.sal + (e.sal/12) + nvl(e.comm,0) - (e.sal * 0.033), '9,999') as �Ǽ��ɾ�,
	case e.deptno
		when 10 then to_char(e.sal*0.07, '9,999')
		when 20 then to_char(e.sal*0.04, '9,999')
		when 30 then to_char((e.sal+nvl(e.comm,0))*0.1, '9,999')
		else to_char(e.sal*0.03, '9,999')
	end as �����λ��,
	e.deptno, lower(d.dname), lower(d.loc),
	z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.deptno = d.deptno and z.seq = e.empno)
	and e.ename like '__A_S';
