# where - 조건

# 단순 비교 연산
select
*
from
student_tb
where
student_name = "정상훈";
# student_tb 안에 있는 student_name = "정상훈" 이름을 가진 값을 where을 이용해 찾아 오라는 코드

# OR 연산
select
student_id,
student_name
from
student_tb
where
student_name = "정상훈"
or student_name = "정상일";
# 실행순서 // from -> where -> select

# IN 연산
select
*
from
student_tb
where
student_name in ("정상훈", "정상일", "정상이");
# in 명령어에 and 명령어를 같이 사용 가능하다

# AND 연산
select
*
from
student_tb
where
student_id > 2
and student_id < 4;
# 2보단 작고 4보단 큰 student_id 를 찾는 명령어

# BETWEEN A AND B -> ~부터 ~까지
select
*
from
student_tb
where
student_id between 2 and 4;
# 2 이상 4 이하 의 student_id 를 찾는 명령어

# NOT
select
*
from
student_tb
where
not student_name != "장싱흔";

# NULL 체크
# is null 긍정
# is not num11 부정


select
*
from
student_tb
where
introduce is null;
-- introduce is not null;

insert into student_tb
values
(0, "손경태", "010-1111-2222", "aaa@gmail.com", null, now()),
(0, "김지현", "010-1111-3333", "bbb@naver.com", null, now()),
(0, "김동인", "010-2222-3333", "ccc@gmail.com", null, now()),
(0, "김정현", "010-4444-3333", "aaabbb@naver.com", null, now()),
(0, "권오광", "010-5555-2222", "bbbccc@kakao.com", null, now()),
(0, "권혁진", "010-1111-5555", "aaabbbccc@kakao.com", null, now());

# 와일드 카드(like)
select
*
from
student_tb
where
student_name like "김%";
# like 명령어를 통하여 "김" 자가 들어가는 "김%" 와이드카드를 입력하여 호출하는 명령어

select
*
from
student_tb
where
email like "%gmail.com";
# "%gmail.com" 로 끝나는 이메일들만 찾아서 출력해라는 명령

select
*
from
student_tb
where
phone like "%2222%";

select
*
from
student_tb
where
phone like "%2222%"
and not phone like "%2222";
# 전화번호 가운대 2222 정보만 호출하게 만든 명령어

select
*
from
student_tb
where
email like "___bbb%";
# bbb를 포함하는데 뒤에는 아무거나 와도 상관없지만 언더바___ 3개를 쓰면 앞에 글자 3개를 가져 온다
# ___ 언더바는 1개당 1글자를 가져온다
