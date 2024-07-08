-- Group by -> 집계, 중복제거
# distinct -> 중복제거 명령어는 2번 쓸수 없다

select
-- 	distinct category_id,
-- 	distinct publisher_id
# 2번 사용 할 수 없다
    distinct
    category_id,
    publisher_id
from
	book_tb;

select    
	category_id,
    count(*)
from
	book_tb
where
	book_id > 7000
group by
	category_id;
# 실행순서 = from -> where -> group by -> select 순으로 실행된다

-- 도서명 중 '돈' 이라는 글자가 들어간 데이터들을 찾아 카테고리별로 묶으시오. 
-- 그리고 카테고리 별로 도서 개수가 출력되어야한다.

select
	category_id,
    count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id;