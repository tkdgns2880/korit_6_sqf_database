# 데이터 조회(DML - SELECT)
select * from student_tb;

select `student_id`, `student_name, email`, `introduce`, `admission_date` from `study`.`student_tb`;
select student_id, student_name, email, introduce, admission_date from `study`.`student_tb`;
select student_id, student_name, email, introduce, admission_date from `student_tb`;
select student_id, student_name, email, introduce, admission_date from student_tb;
# 4개다 같은 코드

select student_id, student_name from student_tb; # 원하는 값만 보고 싶으면 컬럼을 원하는 값만 호출하면 된다
select student_name, student_id from student_tb; # 원하는대로 호출하는 순서도 변경이 가능하다
select student_id, student_name as s_name from student_tb; # 원하는대로 컬럼의 이름도 변경이 가능하다
# as -> 알리야스 컬럼네임
select 1; # as 를 쓰지 않을 경우 컬럼이름도 1이 들어간다
select 1 as number; #  as를 이용해 컬럼네임을 number로 변경한다
select 1 as number, "정상훈" as name, 31 as age; # as를 이용해 테이블을 따로 만들지 않아도 표를 만들수 있다


# union(all) 병합 조건 - 컬럼의 개수와 자료형이 동일한 select 결과만 병합 가능
# union -> 중복 제거 후 select 결과 병합
# union all -> 중복 제거 없이 select 결과 병합

select 1 as number, "정상훈" as name, 31 as age
union all          # 셀렉트와 또다른 셀렉트를 합칠때 중복까지 허용가능 하다
select 2 as number, "정상일" as name, 32 as age;

select 1 as number, "정상훈" as name, 31 as age
union              # 셀렉트와 또다른 셀렉트를 합쳐 주지만 중복허용이 안된다
select 2 as number, "정상일" as name, 32 as age
union
select 2 as number, "정상일" as name, 32 as age;

select student_id, student_name from student_tb
union all
select student_id, phone from student_tb;

select
number,
name
from
(select 1 as number, "정상훈" as name, 31 as age
union all
select 2 as number, "정상일" as name, 32 as age
union all
select 2 as number, "정상일" as name, 32 as age) as temp_tb; # 가짜 테이블 명을 만들어줘야 출력이 가능하다
# select 결과 만으로도 테이블을 만들수 있다