%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Lokhin Wu
%Program Name: Tetris
%Date: December 12, 2016
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Tetris game programmed in Turing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This will draw the picture
%showing the three difficulties
%Easy, Medium, Hard
process displayDifficulty
    Pic.Draw (TetrisDifficulty, 0, 0, picCopy)
end displayDifficulty

% main procedure to handle the intro window
procedure displayDifficultyWindow

    % flag that intro screen is open - global var isIntroWindowOpen
    isIntroWindowOpen := true
    % Open the window
    var winID : int
    winID := Window.Open ("position:center;center,graphics:425;450,title:Tetris")


    fork displayDifficulty

    % Window will continue until quit button is pressed
    loop
	exit when GUI.ProcessEvent or isIntroWindowOpen = false
	Mouse.ButtonWait ("down", mouseX, mouseY, btnNumber, btnUpDown)
	%If the user clicks on EASY, it sets the difficulty variable to "EASY"
	if (mouseX >= 115 & mouseX <= 307) & (mouseY >= 310 and mouseY <= 357) then
	    difficulty := "EASY"
	    delayAmount := 3
	    exit
	    %If the user clicks on MEDIUM, it sets the difficulty variable to "MEDIUM"
	elsif (mouseX >= 60 & mouseX <= 362) & (mouseY >= 202 and mouseY <= 247) then
	    difficulty := "MEDIUM"
	    delayAmount := 2
	    exit
	    %If the user clicks on HARD, it sets the difficulty variable to "HARD"
	elsif (mouseX >= 112 & mouseX <= 309) & (mouseY >= 97 and mouseY <= 140) then
	    difficulty := "HARD"
	    delayAmount := 1
	    exit
	end if
    end loop

    %close/release the window
    Window.Close (winID)




end displayDifficultyWindow
