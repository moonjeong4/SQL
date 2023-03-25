delimiter $$

CREATE or REPLACE PROCEDURE transferFunds (
	in account_from int UNSIGNED,
	in account_to int UNSIGNED, 
	in amount decimal(10,2), 
	out amount_withdrawn decimal(10,2))
BEGIN 
	DECLARE frrr decimal(10,2);
	DECLARE tooo decimal(10,2);
	set amount_withdrawn := amount * 1.03;

	start transaction;
	
	SELECT balance into frrr from account where account_id = account_from for update;
	select balance into tooo from account where account_id = account_to for update;
	
	
	if frrr >= amount_withdrawn then
		set frrr := frrr - amount_withdrawn;
		set tooo := tooo + amount;
		UPDATE account set balance = frrr where account_id = account_from;
		UPDATE account set balance = tooo where account_id = account_to;
	else 
		set amount_withdrawn = 0;
	end if;
	
	commit;
END$$

delimiter ;

call transferFunds(1, 2, 500, @nb)

SELECT @nb

