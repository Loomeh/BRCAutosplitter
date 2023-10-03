/*
-------------------------------------
BOMB RUSH CYBERFUNK AUTOSPLITTER (PC)
-------------------------------------

Created by: Austin 'Auddy' Davenport and Loomeh
Special thanks to: Ninja Cookie, kitcarsonn, Christian Royle, Helix13, YellowBoy and Sooldy
*/


	/*	Bomb Rush Cyberfunk Autoplitter & Load Remover
		Stage IDs
			255 main menu
			8 = Prologue
			5 = Hideout
			4 = Versum Hill
			11 = Millennium Square
			12 = Brink Terminal
			6 = Millennium Mall
			7 = Mataan
			9 = Pyramid Island
		Objective IDs
			CH1
			0 = Prologue - EscapePoliceStation
			1 = Hideout - Join the BOMB RUSH CREW
			2 = Versum Hill - Do graffiti for Rep and challenge the FRANKS for info on DJ Cyber
			3 = Dream 1 - Find a way to wake up from the dream.
			CH2
			4 = Millennium Square - Head to Millennium Square to face ECLIPSE.
			5 = Millennium Square & Brink Terminal - Get REP and challenge ECLIPSE on their home turf.
			6 = Dream 2 - 
			CH3
			7 = Millennium Mall - BeatDotExe
			8 = Dream 3 - Do it.
			CH4
			15 = Versum Hill - SearchForPrinceVersum
			16 = Millennium Square - SearchForPrinceSquare
			17 = Brink Terminal - SearchForPrinceBrink
			18 = Mataan - SearchForPrinceMataan
			9 = Pyramid Island - BeatSamurai
			10 = Dream 4
			CH5
			11 = Beat FUTURISM in Mataan.
			12 = Dream 5
			13 = FinalBoss
			CH6
			14 = Hang out
			19 = MAX
	*/
		 
state("Bomb Rush Cyberfunk")
{
	// Working on these versions:
	// Version 1.0.19864 (patch 1 8/30/2023)
	byte stageID : "UnityPlayer.dll", 0x01ADBA40, 0x30, 0x50, 0x28, 0x28, 0x70, 0x10, 0xBC;
	byte objectiveID : "UnityPlayer.dll", 0x01ADBA40, 0x30, 0x50, 0x28, 0x90, 0x70, 0x28, 0x58;
	byte SnakeBossState : "UnityPlayer.dll", 0x01A79540, 0x0, 0x700, 0x568, 0x5D8, 0xD8, 0x20, 0x78, 0x650, 0x20, 0x2E4;
	bool loading : "UnityPlayer.dll", 0x01ADBA40, 0x68, 0x20, 0x140, 0x0, 0x120, 0x30, 0x57;
	bool inCutscene : "UnityPlayer.dll", 0x01A8DFC0, 0x28, 0x18, 0x18, 0x18, 0x10, 0x2A8;
}

init
{
	// Set initial values
	vars.gameMode = 0;	// Set the game mode to None = 0, Any% = 1, Glitchless = 2
}

startup
{
	refreshRate = 200;
	vars.splashOver = true;
	
	// Any%
	settings.CurrentDefaultParent = null;
	settings.Add("Any", true, "Any%");
	settings.SetToolTip("Any", "Check this Option if you want to run Any%");
	
		// Chapter 1
		settings.CurrentDefaultParent = "Any";
		settings.Add("chapter1AnyTool", true, "Chapter 1 Splits");
	
			settings.CurrentDefaultParent = "chapter1AnyTool";
			settings.Add("prologueAny",true,"Prologue End");
			settings.Add("hideoutEscape",false,"Mataan Start");
			settings.Add("hideoutAny",true,"Versum Hill Start");
			settings.Add("versumAny",true,"Dream Sequence 1 Start");
			settings.Add("chapter1Any",true,"Chapter 1 End");
		
		// Chapter 2
		settings.CurrentDefaultParent = "Any";
		settings.Add("chapter2AnyTool", true, "Chapter 2 Splits");
	
			settings.CurrentDefaultParent = "chapter2AnyTool";
			settings.Add("squareAny",true,"Brink Terminal Start");
			settings.Add("brinkAny",true,"Dream Sequence 2 Start");
			settings.Add("chapter2Any",true,"Chapter 2 End");
		
		// Chapter 3
		settings.CurrentDefaultParent = "Any";
		settings.Add("chapter3AnyTool", true, "Chapter 3 Splits");
	
			settings.CurrentDefaultParent = "chapter3AnyTool";
			settings.Add("enterMallAny",true,"Millennium Mall Start");
			settings.Add("mallAny",true,"Dream Sequence 3 Start");
			settings.Add("chapter3Any",true,"Chapter 3 End");
	
		// Chapter 4
		settings.CurrentDefaultParent = "Any";
		settings.Add("chapter4AnyTool", true, "Chapter 4 Splits");
	
			settings.CurrentDefaultParent = "chapter4AnyTool";
			settings.Add("prince1Any",false,"Flesh Prince Versum End");
			settings.Add("prince2Any",false,"Flesh Prince Millennium End");
			settings.Add("prince3Any",false,"Flesh Prince Brink End");
			settings.Add("prince4Any",false,"Pyramid Island Start");
			settings.Add("pyramidAny",true,"Dream Sequence 4 Start");
			settings.Add("chapter4Any",true,"Chapter 4 End");
	
		// Chapter 5
		settings.CurrentDefaultParent = "Any";
		settings.Add("chapter5AnyTool", true, "Chapter 5 Splits");
	
			settings.CurrentDefaultParent = "chapter5AnyTool";
			settings.Add("finalAny",true,"Final Boss Defeated");
	
	// Glitchless
	settings.CurrentDefaultParent = null;
	settings.Add("Glitchless", false, "Glitchless");
	settings.SetToolTip("Glitchless", "Check this Option if you want to run Any% Glitchless");
	
		// Chapter 1
		settings.CurrentDefaultParent = "Glitchless";
		settings.Add("chapter1GlitchlessTool", true, "Chapter 1 Splits");
	
			settings.CurrentDefaultParent = "chapter1GlitchlessTool";
			settings.Add("prologueGlitchless",false,"Prologue End");
			settings.Add("hideoutGlitchless",false,"Versum Hill Start");
			settings.Add("versumGlitchless",false,"Dream Sequence 1 Start");
			settings.Add("chapter1Glitchless",true,"Chapter 1 End");
		
		// Chapter 2
		settings.CurrentDefaultParent = "Glitchless";
		settings.Add("chapter2GlitchlessTool", true, "Chapter 2 Splits");
	
			settings.CurrentDefaultParent = "chapter2GlitchlessTool";
			settings.Add("squareGlitchless",false,"Brink Terminal Start");
			settings.Add("brinkGlitchless",false,"Dream Sequence 2 Start");
			settings.Add("chapter2Glitchless",true,"Chapter 2 End");
		
		// Chapter 3
		settings.CurrentDefaultParent = "Glitchless";
		settings.Add("chapter3GlitchlessTool", true, "Chapter 3 Splits");
	
			settings.CurrentDefaultParent = "chapter3GlitchlessTool";
			settings.Add("enterMallGlitchless",false,"Millennium Mall Start");
			settings.Add("mallGlitchless",false,"Dream Sequence 3 Start");
			settings.Add("chapter3Glitchless",true,"Chapter 3 End");
			
		// Chapter 4
		settings.CurrentDefaultParent = "Glitchless";
		settings.Add("chapter4GlitchlessTool", true, "Chapter 4 Splits");
	
			settings.CurrentDefaultParent = "chapter4GlitchlessTool";
			settings.Add("prince1Glitchless",false,"Flesh Prince Versum End");
			settings.Add("prince2Glitchless",false,"Flesh Prince Millennium End");
			settings.Add("prince3Glitchless",false,"Flesh Prince Brink End");
			settings.Add("prince4Glitchless",false,"Pyramid Island Start");
			settings.Add("pyramidGlitchless",false,"Dream Sequence 4 Start");
			settings.Add("chapter4Glitchless",true,"Chapter 4 End");
			
		// Chapter 5
		settings.CurrentDefaultParent = "Glitchless";
		settings.Add("chapter5GlitchlessTool", true, "Chapter 5 Splits");
	
			settings.CurrentDefaultParent = "chapter5GlitchlessTool";
			settings.Add("mataanGlitchless",true,"Dream Sequence 5 Start");
			settings.Add("endgameGlitchless",true,"Endgame Start");
			settings.Add("finalGlitchless",true,"Final Boss Defeated");
}

start
{
	// Settings for New Game start Any%
	if(settings["Any"] && (current.stageID == 8 && (current.inCutscene && (old.loading && !current.loading))))
	{
		vars.gameMode = 1;	// Set game mode
		vars.splashOver = true;
		return true;
	}
	
	// Settings for New Game start Glitchless
	if(settings["Glitchless"] && (current.stageID == 8 && (current.inCutscene && (old.loading && !current.loading))))
	{
		vars.gameMode = 2;	// Set game mode
		vars.splashOver = true;
		return true;
	}
}

split
{
	
	// Any%
	if((vars.gameMode == 1) 	&&
	(settings["prologueAny"] 	&& 	(current.stageID == 5 && old.stageID == 8))
	||
	(settings["hideoutEscape"]	&&	((current.stageID == 5 && !current.inCutscene && (current.loading && !old.loading)) && current.objectiveID == 0))
	||
	(settings["hideoutAny"]		&&	((current.stageID == 4 && (old.stageID == 5 || old.stageID == 11)) && (current.objectiveID == 0 || current.objectiveID == 1 || current.objectiveID == 2)))
	||
	(settings["versumAny"]		&&	(current.stageID == 4 && (current.objectiveID == 3 && old.objectiveID == 2)))
	||
	(settings["versumAny"]		&&	(current.stageID == 4 && (current.objectiveID == 3 && old.objectiveID == 0))) // Additional fix for hideout skip
	||
	(settings["chapter1Any"]	&&	((current.stageID == 5 && old.stageID == 4) && current.objectiveID == 4))
	||
	(settings["squareAny"]		&&	((current.stageID == 12 && old.stageID == 11) && current.objectiveID == 5))
	||
	(settings["brinkAny"]		&&	(current.stageID == 12 && (current.objectiveID == 6 && old.objectiveID == 5)))
	||
	(settings["chapter2Any"]	&&	((current.stageID == 5 && old.stageID == 12) && current.objectiveID == 7))
	||
	(settings["enterMallAny"]	&&	((current.stageID == 6 && old.stageID == 11) && current.objectiveID == 7))
	||
	(settings["mallAny"]		&&	(current.stageID == 6 && (current.objectiveID == 8 && old.objectiveID == 7)))
	||
	(settings["chapter3Any"]	&&	((current.stageID == 5 && old.stageID == 6) && current.objectiveID == 15))
	||
	(settings["prince1Any"]		&&	(current.stageID == 4 && (current.objectiveID == 16 && old.objectiveID == 15)))
	||
	(settings["prince2Any"]		&&	(current.stageID == 11 && (current.objectiveID == 17 && old.objectiveID == 16)))
	||
	(settings["prince3Any"]		&&	(current.stageID == 12 && (current.objectiveID == 18 && old.objectiveID == 17)))
	||
	(settings["prince4Any"]		&&	((current.stageID == 5 && old.stageID == 7) && current.objectiveID == 9))
	||
	(settings["prince4Any"]		&&	((current.stageID == 9 && old.stageID == 11) && (current.objectiveID == 15 || current.objectiveID == 9))) // Fix for early pyramid
	||
	(settings["pyramidAny"]		&&	(current.stageID == 9 && (current.objectiveID == 10 && old.objectiveID == 9)))
	||
	(settings["pyramidAny"]		&&	(current.stageID == 9 && (current.objectiveID == 10 && old.objectiveID == 15))) // Pyramid skip
	||
	(settings["chapter4Any"]	&&	((current.stageID == 5 && old.stageID == 9) && current.objectiveID == 11))
	||
	(settings["finalAny"]		&&	(current.stageID == 7 && (current.objectiveID == 11 || current.objectiveID == 13) && (current.SnakeBossState == 8 && old.SnakeBossState != 8))))
	{
		return true;
	}
	
	// Glitchless
	if((vars.gameMode == 2) 			&&
	(settings["prologueGlitchless"]		&&	(current.stageID == 5 && old.stageID == 8))
	||
	(settings["hideoutGlitchless"] 		&&	((current.stageID == 4 && old.stageID == 5) && current.objectiveID == 2))
	||
	(settings["versumGlitchless"]		&&	(current.stageID == 4 && (current.objectiveID == 3 && old.objectiveID == 2)))
	||
	(settings["chapter1Glitchless"]		&&	((current.stageID == 5 && old.stageID == 4) && current.objectiveID == 4))
	||
	(settings["squareGlitchless"]		&&	((current.stageID == 12 && old.stageID == 11) && current.objectiveID == 5))
	||
	(settings["brinkGlitchless"]		&&	(current.stageID == 12 && (current.objectiveID == 6 && old.objectiveID == 5)))
	||
	(settings["chapter2Glitchless"]		&&	((current.stageID == 5 && old.stageID == 12) && current.objectiveID == 7))
	||
	(settings["enterMallGlitchless"]	&&	((current.stageID == 6 && old.stageID == 11) && current.objectiveID == 7))
	||
	(settings["mallGlitchless"]			&&	(current.stageID == 6 && (current.objectiveID == 8 && old.objectiveID == 7)))
	||
	(settings["chapter3Glitchless"]		&&	((current.stageID == 5 && old.stageID == 6) && current.objectiveID == 15))
	||
	(settings["prince1Glitchless"]		&&	(current.stageID == 4 && (current.objectiveID == 16 && old.objectiveID == 15)))
	||
	(settings["prince2Glitchless"]		&&	(current.stageID == 11 && (current.objectiveID == 17 && old.objectiveID == 16)))
	||
	(settings["prince3Glitchless"]		&&	(current.stageID == 12 && (current.objectiveID == 18 && old.objectiveID == 17)))
	||
	(settings["prince4Glitchless"]		&&	((current.stageID == 5 && old.stageID == 7) && current.objectiveID == 9))
	||
	(settings["pyramidGlitchless"]		&&	(current.stageID == 9 && (current.objectiveID == 10 && old.objectiveID == 9)))
	||
	(settings["chapter4Glitchless"]		&&	((current.stageID == 5 && old.stageID == 9) && current.objectiveID == 11))
	||
	(settings["mataanGlitchless"]		&&	(current.stageID == 7 && (current.objectiveID == 12 && old.objectiveID == 11)))
	||
	(settings["endgameGlitchless"]		&&	(current.stageID == 7 && (current.objectiveID == 13 && old.objectiveID == 12)))
	||
	(settings["finalGlitchless"]		&&	(current.stageID == 7 && ((current.objectiveID == 11 || current.objectiveID == 13) && (current.SnakeBossState == 8 && old.SnakeBossState != 8)))))
	{
		return true;
	}
}

isLoading
{
	if (!vars.splashOver)
	{
		if (current.loading)
		{
			vars.splashOver = true;
		}
		return true;
	}
	return current.loading;
}

reset
{
	// Reset if we go to Prologue from Main Menu
	if(current.stageID == 8 && (current.inCutscene && (old.loading && !current.loading)))
	{
		vars.gameMode = 0;
		return true;
	}
}

exit
{
    // pauses the timer if the game crashes
	vars.splashOver = false;
	timer.IsGameTimePaused = true;
}
