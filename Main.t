%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Lokhin Wu
%Program Name: Tetris
%Date: December 12, 2016
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Tetris game programmed in Turing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% files/code folder
include "files/code/includes.t"
setscreen ("position:center;center,graphics:425;450,title:Tetris,nobuttonbar,nocursor")
loop
    cls
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % procedure to set all initial global variable with file scope
    % even if already set (located in MyGlobalVars.t)
    setInitialGameValues
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Play Tetris Theme
    fork playTheme
    % A.  Display menu screen; user will click play when they are ready
    displayIntroWindow
    % B.      Ask user what difficulty they want: easy, medium, hard (the difficulty is based on how fast pieces move down the grid)
    displayDifficultyWindow
    % C.      Ask user if they want to view the instructions, if they choose yes, display from instructions.txt line by line on the screen, if no, start game
    Pic.Draw (TetrisBG, 0, 0, picCopy)
    Font.Draw ("INSTRUCTIONS? (Y/N)", 40, 365, impact30, 0)
    getch (YesToInstructions)
    if YesToInstructions = "y"| YesToInstructions = "Y" then
	% The Instruction screen will display and pause the porgram
	displayInstructionWindow
    end if
    % D.      (steps for Tetris game)

    % 1.      Draw box on screen with dimensions of 20 x 10
    drawBoardOutline
    %Generate a random block initially
    getRandBlock
    loop
	%This will exit the game when gameOver variable is set to true (checked by procedure, checkGameOver)
	exit when gameOver = true
	% 2.      Random number generator will generate a random number between 1 and 7. Each number presents a different Tetris piece
	% I found out that if I generate a "Next Block", the "Next Block" would be used right away, because I call the moveRandBlock procedure right after, so there
	% is no actual Next Block. I fixed it by moving the getRandBlock and displayRandBlock into the moveRandBlock procedures, so it shows up as the next block
	% 3.      Depending on what piece was generated, a value would be assigned in the array for each cell the piece is supposed to be. Each time it will move down by one position until it hits the end of the array or another piece.
	moveRandBlock
	%This will add 5 to the score everytime a block is dropped
	%Separate scores will be assigned when a line is cleared
	score += 5
	% 4.      Each time a value is moved down in the array, it will draw the corresponding Tetris pieces where the array values are. For example, 0 = blank, 1 = cyan coloured piece, so all array values with 1 will be drawn with a cyan piece.
	% 5.      Check if there is a filled row of Tetris pieces, if so erase the entire row and bring all arrays above it down by one. Keep checking for all rows each time a piece is placed.
	checkRowFilled
	% 6.      Check if it is "Game Over," meaning the Tetris pieces are filled to the top and they try place outside of the space they have.
	checkGameOver
	% 7.      Go back to step 3 until game is over
    end loop
    cls
    Pic.Draw (TetrisBG, 0, 0, picCopy)
    % 8.      Display score and save to Scores.txt
    displayAndSaveScore
    % E.      Display top 5 high scores by shorting the file, "Scores.txt" and ask the user if they want to play again. If the user wants to play again, reset all variable values.
    displayHighScores
    var key : string (1)
    Font.Draw ("PLAY AGAIN? (Y/N)", 65, 65, impact30, 0)
    getch (key)
    exit when key = "N" or key = "n"

end loop

Music.PlayFileStop
