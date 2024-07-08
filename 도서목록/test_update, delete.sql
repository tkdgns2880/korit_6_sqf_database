SELECT * FROM study.student_tb;

# 이메일 데이터 중 @앞에 bbb가 포함된 정보의 introduce 데이터를 
# 'bbb를 포함하고 있는 계정입니다.' 라고 수정하고 student_id가 5 ~ 7인 데이터들을 삭제하시오.

select * from student_tb;

update
	student_tb
set
	introduce = "bbb를 포함하고 있는 계정입니다"
where
	email like "%bbb%@%";

delete
from
	student_tb
where
	student_id between 5 and 7;
    # between -> 지정한숫자 and 지정한숫자까지 삭제하는 명령어
    # 같은 명령어
--  student_id > 4
--  and student_id < 8;
    
    