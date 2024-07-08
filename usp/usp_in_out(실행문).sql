select @@autocommit;
set @@autocommit = 0;

set @total = 0;
set @err = 0;
call usp_mod_score("이병", 90, 70, 80, @total, @err);

select @total, @err;