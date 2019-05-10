select car_img, maker, model, car_year, price, car_option, hiredate
from	(select car_img, maker, model, car_year, price, car_option, hiredate, row_number() over(order by hiredate desc) r_num
		from(select cmo.car_img, cma.maker, cmo.model, cmo.car_year, cmo.price, cmo.car_option, cmo.hiredate
	 		 from car_maker cma, car_model cmo
	 	 	 where cmo.model=cma.model))
where r_num between 1 and 10
