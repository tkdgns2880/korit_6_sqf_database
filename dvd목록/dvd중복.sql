select * from dvd_register_tb;

insert into dvd_register_tb
values
	(0, 1, now()),
	(0, 1, now()),
	(0, 1, now()),
	(0, 1, now());
    
select
	0,
    dvd_id,
    now()
from
	dvd_tb

select
	0,
    dvd_id,
    now()
from
	dvd_tb

select
	0,
    dvd_id,
    now()
from
	dvd_tb
order by
	dvd_id

insert into dvd_register_tb
select
	0,
    dt1.dvd_id,
    now()
from
	dvd_tb dt1
    left outer join dvd_tb dt2 on(dt2.dvd_id > 4);