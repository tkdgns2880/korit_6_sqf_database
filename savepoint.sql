# rollback을 하게되면 start transaction 다시 해야함 
# savepoint로 롤백시 상관없음
start transaction; # {

# 하나하나 실행명령을 줘야 실행한다

set @name = "권혁진";
set @phone = "010-6666-8888";

savepoint sp_insert_name;
insert into join1_tb
values(0, @name);

savepoint sp_insert_phone;
insert into join2_tb
values(0, @phone);

rollback to sp_insert_phone;

set @new_join1_id = 0;
set @new_join2_id = 0;

select
	join1_id into @new_join1_id
from
	join1_tb
order by
	join1_id desc
limit 0, 1;

select
	join2_id into @new_join2_id
from
	join2_tb
order by
	join2_id desc
limit 0, 1;

select @new_join1_id;

insert into master_tb
values(0, @new_join1_id, @new_join1_id);

commit;
