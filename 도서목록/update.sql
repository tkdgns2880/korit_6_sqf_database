# 데이터 수정(DML - UPDATE)

select * from student_tb;

select
	student_id
from
	student_tb
where
	student_name = "정상훈";
# student_name = "정상훈"; 에서 이름을 찾아 id가 나오게 만든 명령어
    
update 
	student_tb
set
	email = "tkdgns2880@gmail.com"
where
    student_id in (select       # 결과가 여러개면 select 전에 in 을 넣어줘야 한다
						temp_student_tb.student_id
					from
						(select * from student_tb) as temp_student_tb
                        # update에서 기존을 테이블을 불러와서 as 를 이용해 가상의 테이블을 하나 더 생성해서 사용
					where
						temp_student_tb.student_name = "정상훈");
# 찾은 id의 값의 이메일을 새로 정의하는 명령어alter

update
	student_tb
set
	phone = "010-1234-4321",
    email = "tkdgns2880@naver.com"
where
	student_id = 3;
# id 3번을 가진 값의 폰번호와 이메일의 주소를 변경해주는 명령어