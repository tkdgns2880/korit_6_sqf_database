# 도서 목록에서 출판사별로 category의 count를 집계한다.
# rank() -> 순위의 숫자를 1 2 2 4 중복된 순위가 있으면 번호를 다음번호가 생략된다
# dense_rank() -> 순위의 숫자를 1 2 2 3 중복된 순위가 있어도 숫자 그대로 순위를 매겨준다
# row_number() -> 순위의 숫자를 1 2 3 4 같은 순위라도 숫자를 중복되게 보여주지 않고 숫자 그대도 순위를 매겨준다

select
	# rank() 를 달면 over() 는 자동으로 따라와야한다
--  rank() over(partition by publisher_id order by book_count desc) as `rank`,       # 번호, 순위매기는 단위 -> 1 2 2 4
    # 카테고리별로 인기많은 도서 순위를 찾을수 있다 
    # partition by 각각의 컬럼안에서 순위를 찾아주는 명령어 도서의 순위가 같다면 순번도 같다
--  dense_rank() over(partition by publisher_id order by book_count desc) as `dense_rank`,     # 번호, 순위매기는 단위 -> 1 2 2 3
	row_number() over(partition by publisher_id order by book_count desc) as `num`,      # 번호, 순위매기는 단위 -> 1 2 3 4
--  row_number()는 도서의 순위를 한번더 걸러서 순위를 찾아준다 도서의 순위가 같아도 하나하나 순번을 매겨준다
	pc_count_tb.*
from
	(select
		publisher_id,
		category_id,
		count(*) as book_count
	from
		book_tb
	group by
		publisher_id,
		category_id) as pc_count_tb) as book_row_number_tb
where
	num = 1; # 1순위인 도서들만 싹정리해준다
	