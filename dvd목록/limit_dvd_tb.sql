# from -> where -> group by -> select -> having -> order by -> limit // 순으로 실행된다

select
	dvd_id,
    dt.registration_number,
    dt.title,
    dt.producer_id,
    pdt.producer_name,
    dt.publisher_id,
    pbt.publisher_name,
    dt.publication_year,
    dt.database_date
from
	dvd_tb dt
    left outer join producer_tb pdt on (pdt.producer_id = dt.producer_id)
    left outer join publisher_tb pbt on (pbt.publisher_id = dt.publisher_id)
limit 10, 10;
# limit 순서, 횟수;
# 페이지 만드는꿀팁 (n - 1) * 10