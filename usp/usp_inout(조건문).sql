CREATE DEFINER=`admin`@`%` PROCEDURE `usp_square`(
	inout num int
)
BEGIN
	set num = num * num;
END