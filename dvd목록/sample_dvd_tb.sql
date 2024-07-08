SELECT * FROM dvd_db.sample_dvd_tb;

select
	distinct
    0,
    제작자
from
	sample_dvd_tb;
    
insert into producer_tb
select
	0,
    제작자
from
	sample_dvd_tb
group by
	제작자;
    
insert into publisher_tb
select
	nullif(발행자, "") as publisher_name
from
	sample_dvd_tb
group by
	발행자
having
	publisher_name	is not null;