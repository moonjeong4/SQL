delimiter //

CREATE or REPLACE PROCEDURE generateNames(in n int UNSIGNED)
BEGIN 
			

	loopy: loop
		if(n = 0) then
			leave loopy;
		end if;
	
		SELECT adjective.adjective into @ad from adjective order by rand() LIMIT 1;
	    SELECT noun.noun into @nn from noun order by rand() LIMIT 1;
	    set @bandName := CONCAT(@ad," ",@nn);
	   
	    if right(@nn,1) <> "s" then

	    	set @bandName := CONCAT(@bandName,"s");
	   
	    end if;
	   
		INSERT into `band`(`name`) values (@bandName);
		
		set n := n -1;
	end loop;

end//

delimiter ;


call generateNames(1);




nouns.txt
drawer
circle
line
office
duck
pet
fall
creator


adjectives.txt
fast
responsible
abiding
wonderful
supreme
waggish
elite
boorish