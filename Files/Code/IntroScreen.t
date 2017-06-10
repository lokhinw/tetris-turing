%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Lokhin Wu
%Program Name: Tetris
%Date: December 12, 2016
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Tetris game programmed in Turing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% displays a intro banner

process displayBanner
    Pic.Draw (TetrisIntroScreen, 0, 0, picCopy)
end displayBanner

% main procedure to handle the intro window
procedure displayIntroWindow

    % flag that intro screen is open - global var isIntroWindowOpen
    isIntroWindowOpen := true
    % Open the window
    var winID : int
    winID := Window.Open ("position:center;center,graphics:425;450,title:Tetris")


    fork displayBanner

    % Window will continue until quit button is pressed
    loop
	exit when GUI.ProcessEvent or isIntroWindowOpen = false
	%This detects for a button click
	Mouse.ButtonWait ("down", mouseX, mouseY, btnNumber, btnUpDown)
	%If this mouse is between these coordinates (the play button)
	if (mouseX >= 122 & mouseX <= 294) & (mouseY >= 66 and mouseY <= 161) then
	%Set this variable to false, so the intro sceren closes
	    isIntroWindowOpen := false
	end if
    end loop

    %close/release the window
    Window.Close (winID)




end displayIntroWindow
