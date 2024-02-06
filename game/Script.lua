--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--


entered = false;
hasSpell = false;
castSpellLib = false;

function story(aName)
	if(aName == "start") then
		playMusic("background.wav")
		setBackground("huis.JPG")
		createTextfield("oma beantwoord haar telefoon niet je gaat op bezoek")
		createButton("exit", "het is vast prima ik hoe haar niet lastig te vallen")
		createButton("entrance", "enter the house")
	end
	if(aName == "entrance") then
		if(entered == false) then
			playSound("door.wav")
			entered = true;
		else
			playSound("footstep.wav")
		end
		CLS();
		setBackground("ingang.JPG");
		createTextfield("je bent de gang ingestapt en de hoort gegrom in de slaapkamer.")
		createButton("leftHallway", "ga naar de keuken");
		createButton("rightHallway", "ga naar de woonkamer")
		createButton("upStairs", "ga naar de slaapkamer")
	end
	if(aName == "leftHallway") then
		playSound("footstep.wav")
		CLS();
		setBackground("keuken.jpg")
		createTextfield("je stapt de keuken in en ziet een sleutel liggen.")
		createButton("entrance", "Go back to the corridor.");
		if(hasSpell == false) then
			createButton("searchBooks", "pak de sleutel op")
		end
	end
	if(aName == "searchBooks") then
		CLS();
		playSound("pageFlip.wav")
		createTextfield("je hebt een sleutel gepatk geen idee wat het opent")
		createButton("entrance", "ga terug naar de gang")
		hasSpell = true;
	end
	if(aName == "rightHallway") then
		CLS()
		playSound("footstep.wav")
		setBackground("woonkamer.jpg")
		if(castSpellLib == true) then
			createTextfield("je ziet een swaard achter een slot")
		else
			createTextfield("je stapt de woonkamer in het voelt leeg.")
		end
		
		createButton("entrance", "je stapt terug de gang in")
		if(hasSpell == true and castSpellLib == false) then
			createButton("rightHallwaySpell", "pak het swaard out de kast")
		end
	end
	if(aName == "rightHallwaySpell") then
		CLS()
		createTextfield("je pakt het swaard")
		castSpellLib = true;
		createButton("entrance", "ga terug naar de gang")
	end
	if(aName == "upStairs") then
	CLS()
	playSound("footstep.wav")
		if(hasSpell == true and castSpellLib == true) then
			setBackground("slaapkamer.jpg")
			createTextfield("hallo lieverd sorry dat ik niet opnam op de telefoon")
			createButton("exit", "je kon zwere dat je oma er vroeger anders uitzag maar je gaat gewoon verder met je dag")
		else
			setBackground("wolf.jpg")
			createTextfield("je bent mijn eten ahahahaha")
			createButton("exit", "je wort opgegeten")
		end
	end
	if(aName == "exit") then
		exitGame();
	end
end

