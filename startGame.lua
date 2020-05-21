-- Author Alerino
-- Server Atonis.pl
-- Version 1.0
-- Date 05.11.2019

quest startGame begin
	state start begin
		-- Podczas zalogowania się na serwer
		when login begin
		    if pc.getqf("first") == 0 and pc.get_level() == 1 and pc.get_exp() == 0 then
    			pc.setqf("first", 1)	-- Zapis do MySQL
    			
    			local item = {
    				['all'] = {	-- Przedmioty dla wszystkich
    					{76004, 1},     -- Potki
    					{76021, 1},     -- Potki
    					{27208, 3},     -- Zielona średnia mikstura
    					{27211, 15},     -- Fioletowa średnia mikstura
    					{70038, 1},     -- Peleryna męstwa
    					{71133, 1},     -- Wierzchowiec
    					{50051, 1},     -- Przywołanie koni
    					{50188, 1},     -- Skrzynia ucznia
    					{15005, "EQ"},     -- Buty
    					{13005, "EQ"},     -- Tarcza
    					{17005, "EQ"},     -- Kolczyki
    					{16005, "EQ"},     -- Naszyjnik
    					{14005, "EQ"},     -- Bransoletka
    					{200042, "EQ"},    -- PAS
    				-- 	{72701, "EQ"},     -- Buty wiatru
    				},
    				[1] = {                 -- Warrior
    				    {15, 11205, 12205}, -- Założone
    				    {3005}              -- Ekwipunek
    				},   				    
    				[2] = {                 -- Ninja
    				    {1005, 11405, 79503, 12345},    -- TODO: Kołczan 79503
    				    {15, 2005}
    				},
    				[3] = {                 -- Sura
    				    {15, 11605, 12485},
    				    {}
    				},   				        
    				[4] = {                 -- Shaman
    				    {5005, 11805, 12625},
    				    {7005}
    				}
    			}
    
    			local job = pc.get_job() + 1
    
                -- Ogólne
                -- ds.give_qualification()     -- Alchemy
                horse.set_level(1)         -- Horse level
                pc.set_skill_level(122, 2)  -- Gives 2 combos
                pc.set_skill_level(131, 10) -- Summon a horse
                -- horse.ride()
                
    			-- Handing out items to everyone
    			for i = 1, table.getn(item['all']) do
    			    if item['all'][i][2] == "EQ" then
    			        pc.give_item3(item['all'][i][1])
    			    else
    				    pc.give_item2(item['all'][i][1], item['all'][i][2])
    			    end
    			end
    			
    			-- Handing out items for the class as founded
    			for i = 1, table.getn(item[job][1]) do
    				pc.give_item3(item[job][1][i])
    			end
    			
    			-- Handing out items for the equipment class
    			for i = 1, table.getn(item[job][2]) do
    				pc.give_item2(item[job][2][i], 1)
    			end
    			
    			-- Powiadomienie
    			chat("Have a nice game!")
		    end
        
		end
		
	end
end