select * from sample_book_tb;
# insert select -> 다른테이블 정보를 쉽게 가져오기 위한 명령어
-- 도서관 정보 테이블 데이터 추출 --
insert into library_tb(library_name, library_code, library_url) # select 된 결과 값을 바로 끌어다 쓰는 명령어
select
	도서관명,
    도서관구분코드,
    도서관홈페이지
from
	sample_book_tb
group by
	도서관명,
    도서관구분코드,
    도서관홈페이지;
# 같은 값들끼리 group by를 활용하여 컬럼이름으로 그룹을 따로 만들어준다

-- 카테고리 정보 테이블 데이터 추출 --
insert into category_tb(category_name)
# 테이블 만들때 id를 AI로 잡아놔서 category_id 를 따로 호출받지 않아도 된다
select
	카테고리
--     count(*)
from
	sample_book_tb
group by
	카테고리;
# group by로 같은 값들을 묶어 놓고 count(*)를 이용하여 해당 컬럼에 값이 몇개씩 있는지 알수 있다
insert into publisher_tb(publisher_name)
select
	출판사
from
	sample_book_tb
group by
	출판사;
    
insert into book_type_tb
select
	0,  # AI로 설정을 해놔서 0을 넣어도 되고 book_type_tb(book_type_name) 을 입력해도 된다
	형식
from
	sample_book_tb
group by
	형식;

-- 정규화된 데이터 매칭 --
update
	sample_book_tb as sbt
    left outer join library_tb as lt on (lt.library_name = sbt.도서관명) # 두개의 값이 같으면 join을 해줘라
    left outer join category_tb ct on (ct.category_name = sbt.카테고리) # left outer join 테이블이름 *as* 를 빼도 테이블이름을 변수로 지정할수 있다
    left outer join publisher_tb pt on (pt.publisher_name = sbt.출판사)
    left outer join book_type_tb btt on (btt.book_type_name = sbt.형식)
set
	도서관ID = lt.library_id,
    카테고리ID = ct.category_id,
    출판사ID = if(sbt.출판사 = "", null, pt.publisher_id),
    # sbt.출판사 = "" 공백이면 null pt.publisher_id 값이 있으면 출력해준다
    형식ID = btt.book_type_id;
    
insert into book_tb
select
	0,
	도서관ID,
    도서명,
    저자명,
    `국제표준도서번호(ISBN)`,
    카테고리ID,
    출판사ID,
    `표지주소(URL)`,
    형식ID
from
	sample_book_tb;