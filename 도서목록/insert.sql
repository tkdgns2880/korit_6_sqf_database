# 데이터 삽입(DML - INSERT)

select * from student_tb;

# insert into `study`.`student_tb`   Database가 use되지 않은 경우
# insert into `student_tb`           Database가 use상태인 경우

insert into student_tb
(student_id, student_name, phone, email, admission_date)
values
(0, "정상훈", "010-7131-9648", "tkdgns2880@gmail.com", now());

insert into student_tb
(student_id, student_name, phone, email, admission_date)
values
(0, "정상일", "010-7131-9648", "tkdgns2880@gmail.com", now()),
(0, "정상이", "010-7131-9648", "tkdgns2880@gmail.com", now()),
(0, "정상삼", "010-7131-9648", "tkdgns2880@gmail.com", now());

insert into student_tb
(student_id, student_name, phone, email, introduce, admission_date)
values
(0, "정상훈", "010-7131-9648", "tkdgns2880@gmail.com", null, now());

insert into student_tb
(student_id, phone, email, introduce, student_name, admission_date) # 컬럼에 순서를 바꿔서 입력을 해도 값은 들어간다
values
(0, "010-7131-9648", "tkdgns2880@gmail.com", null, "정상훈", now()); # 컬럼에 순서대로 values를 이용해 값을 넣어줘야 한다

insert into student_tb
(student_id, phone, email, introduce, student_name, admission_date)
values
(0, "010-7131-9648", "tkdgns2880@gmail.com", null, "정상사", now());

insert into student_tb
values
(0, "정상훈", "010-7131-9648", "tkdgns2880@gmail.com", null, now());student_tbcar_tb