%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Lokhin Wu
%Program Name: Tetris
%Date: December 12, 2016
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Tetris game programmed in Turing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   MyGlobalVars.t
%   All global variables are coded in this file.
%   These will have FILE scope.
%   These must be document thoroughly - Descriptive name,
%   where used and for what purpose

% Main program variables
var YesToInstructions : string (1)
%Keyboard
var chars : array char of boolean
%Pictures
var TetrisIntroScreen : int := Pic.FileNew ("Images/TetrisIntroScreen.jpg")
var TetrisBG : int := Pic.FileNew ("Images/TetrisBG.jpg")
var TetrisGameBG : int := Pic.FileNew ("Images/TetrisGameBG.jpg")
var TetrisDifficulty : int := Pic.FileNew ("Images/TetrisDifficulty.jpg")
var InstructionScreen : int := Pic.FileNew ("Images/InstructionScreen.jpg")
%Tetris blocks
var i : int := Pic.FileNew ("Images/i.jpg")
var j : int := Pic.FileNew ("Images/j.jpg")
var l : int := Pic.FileNew ("Images/l.jpg")
var o : int := Pic.FileNew ("Images/o.jpg")
var s : int := Pic.FileNew ("Images/s.jpg")
var t : int := Pic.FileNew ("Images/t.jpg")
var z : int := Pic.FileNew ("Images/z.jpg")
%Location of the X cordinate for the Tetris piece on the array grid
var blockX : int
%Location of the Y cordinate for the Tetris piece on the array grid
var blockY : int
%Mouse
var mouseX, mouseY, btnNumber, btnUpDown : int
%Grid
%Set the array rows to 24 to check if the tetris blocks go over 20, if > 20, set gameOver:=true
%This also makes it so the blocks can fall from above, rather than appearing on the screen instantly
%The grid drawn will be 20 x 10
%The tallest block is 4 blocks high when oriented vertically, so 20 + 4 = 24 rows
var tetrisGrid : array 1 .. 24, 1 .. 10 of int
%Game variables
var difficulty : string
var score : int
var blockTurn : int
var delayAmount : int
var delayCtr : int
%Fonts
var impact30 : int := Font.New ("impact:30")
%Introduction Window
var isIntroWindowOpen : boolean % Flag for Introduction Window state open or closed
var isFontWindowOpen : boolean
var gameOver : boolean
var randBlock : int
%File IO
var stream: int
var streamScore : string
%Set the game values before the game begins
proc setInitialGameValues
    isIntroWindowOpen := false
    isFontWindowOpen := false
    % Set all of grid's values to 0 (empty)
    for rows : 1 .. upper (tetrisGrid, 1)
	for cols : 1 .. upper (tetrisGrid, 2)
	    tetrisGrid (rows, cols) := 0
	end for
    end for
    %Set the main game variables to the default
    gameOver := false
    score := 0
    blockX := 4
    blockY := 22
    blockTurn := 1
    delayCtr := 0
end setInitialGameValues
