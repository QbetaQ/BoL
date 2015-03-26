local ts

myHero = GetMyHero()

function OnLoad()
    if (myHero.charName == "Graves") then
		ts = TargetSelector(TARGET_LOW_HP_PRIORITY,650)
        PrintChat ("<font color=\"#66FFFF\">Beta Graves Has Been Loaded <font color=\"#FF0000\"> Good <font color=\"#FFFFFF\"> Game ")
		else
				PrintChat ("<font color=\"#FF0000\"> You Are Not Graves !")
		end
			-- Menu
	Config = scriptConfig("Beta Graves", "newscript")
	Config:addParam("drawCircle", "Basic Attack Range", SCRIPT_PARAM_ONOFF, true)
  Config:addParam("drawCircle2", "Q Range", SCRIPT_PARAM_ONOFF, true)
  Config:addParam("drawCircle3", "W Range", SCRIPT_PARAM_ONOFF, true)
  Config:addParam("drawCircle4", "E Range", SCRIPT_PARAM_ONOFF, true)
	Config:addParam("drawCircle5", "R Range", SCRIPT_PARAM_ONOFF, true)
	Config:addParam("printHp", "Warnings", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("A"))
	Config:addParam("printMn", "Warnings", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("Z"))
	Config:addParam("combo", "Combo mode", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
  Config:addParam("autoIgnite", "Auto Ignite Killable NOT WORK  ", SCRIPT_PARAM_ONOFF, true)
	end 
function OnDraw()
	if (Config.printHp) then
  	if (myHero.health < 210) then
		DrawText("Warning: LOW HP! Drink a potion or return to base!", 18, 100, 100, 0xFFFF0000)
	end
end
 if (Config.printMn) then
	if (myHero.mana < 200) then
		DrawText("Warning: LOW MANA! Drink a potion or return to base!", 18, 100, 120, 0xFFFFFF00)
	end
end
	    if (Config.drawCircle) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 610, 0xFF8400FF)
    end
			    if (Config.drawCircle2) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 950, 0x222222)
				end
							    if (Config.drawCircle3) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 950, 0xFF8400FF)
				end
							    if (Config.drawCircle4) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 425, 0x0000FF)
				end
							    if (Config.drawCircle5) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 1000, 0x00FF00)
				end
				
end
function OnTick()
	-- Small Target Selector
	ts:update()
	
	--Some Settings
	if (ts.target ~= nil) then
		-- W
   if (Config.combo) then
		if (myHero:CanUseSpell(_W) == READY) then
			-- W
			CastSpell(_W, ts.target)
		end
 
		-- E
		if (myHero:CanUseSpell(_E) == READY) then
			-- E
			CastSpell(_E, ts.target.x,ts.target.z)
		end
		
				-- Q
		if (myHero:CanUseSpell(_Q) == READY) then
			-- Q
			CastSpell(_Q, ts.target.x,ts.target.z)
		end
		
				-- R
		if (myHero:CanUseSpell(_R) == READY) then
			-- R
			CastSpell(_R, ts.target.x,ts.target.z)
		end
		
	end
	 end
end