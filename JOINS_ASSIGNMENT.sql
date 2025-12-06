 ------ JOINS PRACTISE TABLES ------

SELECT * FROM public.performance;
SELECT * FROM public.codes_carrier;
SELECT * FROM public.codes_cancellation

--O1 : Display flight date, origin, destination, and carrier description instead of just the carrier code. 

SELECT PER.fl_date,PER.origin,PER.dest, CAR.career_des FROM public.performance AS PER
INNER JOIN  public.codes_carrier CAR  ON CAR.carrier_code =mkt_carrier

--02 : left join 

SELECT PER.fl_date,PER.origin,PER.dest,per.mkt_carrier,can.cancel_desc from 
public.performance per left join public.codes_cancellation can on can.cancellation_code =
per.cancellation_code;

--03 : right join 

SELECT PER.fl_date,PER.origin,PER.dest,per.mkt_carrier,can.cancel_desc from 
public.performance per right join public.codes_cancellation can on 
can.cancellation_code =per.cancellation_code;

--4 : full outer join

SELECT PER.fl_date,PER.origin,PER.dest, CAR.career_des FROM public.performance AS PER
full outer JOIN  public.codes_carrier CAR  ON CAR.carrier_code = per.mkt_carrier

--5 : join with filters and allias 

select PER.fl_date,PER.origin,PER.dest,per.mkt_carrier,car.career_des,can.cancel_desc
from public.performance as per left join public.codes_carrier car on CAR.carrier_code = per.mkt_carrier
inner join public.codes_cancellation can on can.cancellation_code =per.cancellation_code 
where per.cancelled = 1;

--6 : look up via join + CONdition

select PER.fl_date,PER.origin,PER.dest,per.mkt_carrier ,CAR.career_des ,PER.arr_delay_new
from
public.performance PER INNER JOIN
public.codes_carrier AS CAR ON CAR.carrier_code =PER.mkt_carrier
WHERE PER.arr_delay_new > 60 order by PER.arr_delay_new desc limit 10;

--
