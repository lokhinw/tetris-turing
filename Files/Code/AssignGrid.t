%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Lokhin Wu
%Program Name: Tetris
%Date: December 12, 2016
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Tetris game programmed in Turing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This procedure assigns the values to the array grid
%for the block 'I'
proc assignGridI (value, turn : int)
    %This assigns the array values for rotation 1
    if turn = 1 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY, blockX + 2) := value
    end if
    %This assigns the array values for rotation 2
    if turn = 2 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY - 2, blockX) := value
    end if
end assignGridI

%This procedure assigns the values to the array grid
%for the block 'J'
proc assignGridJ (value, turn : int)
    %This assigns the array values for rotation 1
    if turn = 1 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY - 1, blockX + 1) := value
    end if
    %This assigns the array values for rotation 2
    if turn = 2 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY + 1, blockX + 1) := value
    end if
    %This assigns the array values for rotation 3
    if turn = 3 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY + 1, blockX - 1) := value
    end if
    %This assigns the array values for rotation 4
    if turn = 4 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY - 1, blockX - 1) := value
    end if
end assignGridJ

%This procedure assigns the values to the array grid
%for the block 'L'
proc assignGridL (value, turn : int)
    %This assigns the array values for rotation 1
    if turn = 1 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY - 1, blockX - 1) := value
    end if
    %This assigns the array values for rotation 2
    if turn = 2 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY - 1, blockX + 1) := value
    end if
    %This assigns the array values for rotation 3
    if turn = 3 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY + 1, blockX + 1) := value
    end if
    %This assigns the array values for rotation 4
    if turn = 4 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY + 1, blockX - 1) := value
    end if
end assignGridL

%This procedure assigns the values to the array grid
%for the block 'O'
proc assignGridO (value : int)
    tetrisGrid (blockY, blockX) := value
    tetrisGrid (blockY, blockX + 1) := value
    tetrisGrid (blockY - 1, blockX) := value
    tetrisGrid (blockY - 1, blockX + 1) := value
end assignGridO

%This procedure assigns the values to the array grid
%for the block 'S'
proc assignGridS (value, turn : int)
    %This assigns the array values for rotation 1
    if turn = 1 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY - 1, blockX - 1) := value
    end if
    %This assigns the array values for rotation 1
    if turn = 2 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY - 1, blockX + 1) := value
    end if
end assignGridS

%This procedure assigns the values to the array grid
%for the block 'T'
proc assignGridT (value, turn : int)
    %This assigns the array values for rotation 1
    if turn = 1 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY - 1, blockX) := value
    end if
    %This assigns the array values for rotation 2
    if turn = 2 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY, blockX + 1) := value
    end if
    %This assigns the array values for rotation 3
    if turn = 3 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY + 1, blockX) := value
    end if
    %This assigns the array values for rotation 4
    if turn = 4 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
    end if
end assignGridT

%This procedure assigns the values to the array grid
%for the block 'Z'
proc assignGridZ (value, turn : int)
    %This assigns the array values for rotation 1
    if turn = 1 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY, blockX - 1) := value
	tetrisGrid (blockY - 1, blockX) := value
	tetrisGrid (blockY - 1, blockX + 1) := value
    end if
    %This assigns the array values for rotation 2
    if turn = 2 then
	tetrisGrid (blockY, blockX) := value
	tetrisGrid (blockY + 1, blockX + 1) := value
	tetrisGrid (blockY, blockX + 1) := value
	tetrisGrid (blockY - 1, blockX) := value
    end if
end assignGridZ

