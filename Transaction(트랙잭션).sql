# 트랙잭션(Transaction)

set @name = "김준일";

select @name;

select @@autocommit;

set autocommit = 0;

insert into master_tb
values
	(0, 6, 1);