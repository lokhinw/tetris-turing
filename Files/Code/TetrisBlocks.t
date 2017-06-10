%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Lokhin Wu
%Program Name: Tetris
%Date: December 12, 2016
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Tetris game programmed in Turing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This draws the block 'I' in the 'Next' box
proc drawIblock (x, y : int)
    Pic.Draw (i, x + 0, y + 0, picCopy)
    Pic.Draw (i, x + 20, y + 0, picCopy)
    Pic.Draw (i, x + 40, y + 0, picCopy)
    Pic.Draw (i, x + 60, y + 0, picCopy)
end drawIblock

%This draws the block 'J' in the 'Next' box
proc drawJblock (x, y : int)
    Pic.Draw (j, x + 0, y + 0, picCopy)
    Pic.Draw (j, x + 0, y + 20, picCopy)
    Pic.Draw (j, x + 20, y + 0, picCopy)
    Pic.Draw (j, x + 40, y + 0, picCopy)
end drawJblock

%This draws the block 'L' in the 'Next' box
proc drawLblock (x, y : int)
    Pic.Draw (l, x + 0, y + 0, picCopy)
    Pic.Draw (l, x + 20, y + 0, picCopy)
    Pic.Draw (l, x + 40, y + 0, picCopy)
    Pic.Draw (l, x + 40, y + 20, picCopy)
end drawLblock

%This draws the block 'O' in the 'Next' box
proc drawOblock (x, y : int)
    Pic.Draw (o, x + 0, y + 0, picCopy)
    Pic.Draw (o, x + 20, y + 0, picCopy)
    Pic.Draw (o, x + 20, y + 20, picCopy)
    Pic.Draw (o, x + 0, y + 20, picCopy)
end drawOblock

%This draws the block 'S' in the 'Next' box
proc drawSblock (x, y : int)
    Pic.Draw (s, x + 0, y + 0, picCopy)
    Pic.Draw (s, x + 20, y + 0, picCopy)
    Pic.Draw (s, x + 20, y + 20, picCopy)
    Pic.Draw (s, x + 40, y + 20, picCopy)
end drawSblock

%This draws the block 'T' in the 'Next' box
proc drawTblock (x, y : int)
    Pic.Draw (t, x + 0, y + 0, picCopy)
    Pic.Draw (t, x + 20, y + 0, picCopy)
    Pic.Draw (t, x + 20, y + 20, picCopy)
    Pic.Draw (t, x + 40, y + 0, picCopy)
end drawTblock

%This draws the block 'Z' in the 'Next' box
proc drawZblock (x, y : int)
    Pic.Draw (z, x + 0, y + 20, picCopy)
    Pic.Draw (z, x + 20, y + 0, picCopy)
    Pic.Draw (z, x + 20, y + 20, picCopy)
    Pic.Draw (z, x + 40, y + 0, picCopy)
end drawZblock

%This displays the random block generated
%in the 'Next' box
proc displayRandBlock (x, y : int)
    drawBoardOutline
    if randBlock = 1 then
	drawIblock (x, y)
    elsif randBlock = 2 then
	drawJblock (x, y)
    elsif randBlock = 3 then
	drawLblock (x, y)
    elsif randBlock = 4 then
	drawOblock (x, y)
    elsif randBlock = 5 then
	drawSblock (x, y)
    elsif randBlock = 6 then
	drawTblock (x, y)
    elsif randBlock = 7 then
	drawZblock (x, y)
    end if
end displayRandBlock

%This will draw the tetris blocks
%corrosponding to the array values
proc drawTetrisBlocks
    for rows : 1 .. upper (tetrisGrid, 1) - 4
	for cols : 1 .. upper (tetrisGrid, 2)
	    if tetrisGrid (rows, cols) = 0 then
		Draw.FillBox (cols * 20 + 6, rows * 20 + 6, cols * 20 + 25, rows * 20 + 25, 54)
	    elsif tetrisGrid (rows, cols) = 1 then
		Pic.Draw (i, cols * 20 + 6, rows * 20 + 6, picCopy)
	    elsif tetrisGrid (rows, cols) = 2 then
		Pic.Draw (j, cols * 20 + 6, rows * 20 + 6, picCopy)
	    elsif tetrisGrid (rows, cols) = 3 then
		Pic.Draw (l, cols * 20 + 6, rows * 20 + 6, picCopy)
	    elsif tetrisGrid (rows, cols) = 4 then
		Pic.Draw (o, cols * 20 + 6, rows * 20 + 6, picCopy)
	    elsif tetrisGrid (rows, cols) = 5 then
		Pic.Draw (s, cols * 20 + 6, rows * 20 + 6, picCopy)
	    elsif tetrisGrid (rows, cols) = 6 then
		Pic.Draw (t, cols * 20 + 6, rows * 20 + 6, picCopy)
	    elsif tetrisGrid (rows, cols) = 7 then
		Pic.Draw (z, cols * 20 + 6, rows * 20 + 6, picCopy)
	    end if
	end for
    end for
end drawTetrisBlocks

%Procedure for moving the I piece
proc moveIblock (var tetrisGrid : array 1 .. 24, 1 .. 10 of int)
    loop
	Input.KeyDown (chars)
	%This checks depending on which block turn it is
	%this also checks if they rotate it, that the values won't go outside of the array and crash
	if chars (KEY_UP_ARROW) & blockTurn = 1 & blockY - 2 >= 1 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX) = 0 &
		tetrisGrid (blockY - 2, blockX) = 0 then
	    blockTurn := 2
	elsif chars (KEY_UP_ARROW) & blockTurn = 2 & blockX + 2 <= 10 & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 &
		tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY, blockX + 2) = 0 then
	    blockTurn := 1
	end if
	%This checks if the down arrow key is pressed and it will check if there is a block underneath so when you move it down faster, it doesnt go through something
	if chars (KEY_DOWN_ARROW) then
	    if blockTurn = 1 & not (blockY = 1| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0|
		    tetrisGrid (blockY - 1, blockX + 2) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 2 & not (blockY = 3| tetrisGrid (blockY - 3, blockX) not= 0) then
		blockY -= 1
	    end if
	end if
	%This checks depending on which block turn it is
	%This moves the pieces left or right depending on which arrow key was pressed and it will also check if there is another block in the way or if
	%it is hitting a wall, so the pieces don't go into other pieces or outside of the array and crash
	if blockTurn = 1 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 3 <= 10 & tetrisGrid (blockY, blockX + 3) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 2 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 1 <= 10 & tetrisGrid (blockY + 1, blockX + 1) = 0 & tetrisGrid (blockY, blockX + 1) = 0 &
		    tetrisGrid (blockY - 1, blockX + 1) = 0 & tetrisGrid (blockY - 2, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 1 >= 1 & tetrisGrid (blockY + 1, blockX - 1) = 0 & tetrisGrid (blockY, blockX - 1) = 0 &
		    tetrisGrid (blockY - 1, blockX - 1) = 0 & tetrisGrid (blockY - 2, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	%This will assign the array values depending on what the blockTurn is and it will draw blocks on the screen, then erase it
	if blockTurn = 1 then
	    assignGridI (1, 1)
	    drawTetrisBlocks
	    assignGridI (0, 1)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 1| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0|
		    tetrisGrid (blockY - 1, blockX + 2) not= 0
		    then
		exit
	    end if
	end if
	if blockTurn = 2 then
	    assignGridI (1, 2)
	    drawTetrisBlocks
	    assignGridI (0, 2)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 3| tetrisGrid (blockY - 3, blockX) not= 0 then
		exit
	    end if
	end if
	%This delay counter is added so the Tetris pieces move slowly down the screen without making the pieces move side to side slowly
	if delayCtr >= delayAmount then
	    %This moves the block down by one
	    blockY -= 1
	    delayCtr := 0
	end if
	delayCtr += 1
	delay (85)
    end loop
    %When the procedure exits, this will assign the array values so it will stay inside the array rather than erasing it
    if blockTurn = 1 then
	assignGridI (1, 1)
    end if
    if blockTurn = 2 then
	assignGridI (1, 2)
    end if
end moveIblock

%Procedure for moving the J piece
proc moveJblock (var tetrisGrid : array 1 .. 24, 1 .. 10 of int)
    loop
	Input.KeyDown (chars)
	%This checks depending on which block turn it is
	%this also checks if they rotate it, that the values won't go outside of the array and crash
	if chars (KEY_UP_ARROW) & blockTurn = 1 & blockY - 1 >= 1 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
	    blockTurn := 2
	elsif chars (KEY_UP_ARROW) & blockTurn = 2 & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY + 1, blockX + 1) = 0 then
	    blockTurn := 3
	elsif chars (KEY_UP_ARROW) & blockTurn = 3 & blockY - 1 >= 1 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY + 1, blockX - 1) = 0 &
		tetrisGrid (blockY, blockX - 1) = 0 then
	    blockTurn := 4
	elsif chars (KEY_UP_ARROW) & blockTurn = 4 & blockX + 1 <= 10 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 &
		tetrisGrid (blockY - 1, blockX) = 0 then
	    blockTurn := 1
	end if
	%This checks if the down arrow key is pressed and it will check if there is a block underneath so when you move it down faster, it doesnt go through something
	if chars (KEY_DOWN_ARROW) then
	    if blockTurn = 1 & not (blockY = 2| tetrisGrid (blockY - 2, blockX + 1) not= 0| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 2 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 3 & not (blockY = 1| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 4 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 2, blockX - 1) not= 0) then
		blockY -= 1
	    end if
	end if
	%This checks depending on which block turn it is
	%This moves the pieces left or right depending on which arrow key was pressed and it will also check if there is another block in the way or if
	%it is hitting a wall, so the pieces don't go into other pieces or outside of the array and crash
	if blockTurn = 1 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX + 2) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 & tetrisGrid (blockY - 1, blockX) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 2 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY + 1, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY + 1, blockX - 1) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 3 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 & tetrisGrid (blockY + 1, blockX - 2) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 4 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 1 <= 10 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY + 1, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY - 1, blockX - 2) = 0 then
		blockX -= 1
	    end if
	end if
	%This will assign the array values depending on what the blockTurn is and it will draw blocks on the screen, then erase it
	if blockTurn = 1 then
	    assignGridJ (2, 1)
	    drawTetrisBlocks
	    assignGridJ (0, 1)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX + 1) not= 0| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 2 then
	    assignGridJ (2, 2)
	    drawTetrisBlocks
	    assignGridJ (0, 2)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 3 then
	    assignGridJ (2, 3)
	    drawTetrisBlocks
	    assignGridJ (0, 3)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 1| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 4 then
	    assignGridJ (2, 4)
	    drawTetrisBlocks
	    assignGridJ (0, 4)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 2, blockX - 1) not= 0 then
		exit
	    end if
	end if
	%This delay counter is added so the Tetris pieces move slowly down the screen without making the pieces move side to side slowly
	if delayCtr >= delayAmount then
	    %This moves the block down by one
	    blockY -= 1
	    delayCtr := 0
	end if
	delayCtr += 1
	delay (85)
    end loop
    %When the procedure exits, this will assign the array values so it will stay inside the array rather than erasing it
    if blockTurn = 1 then
	assignGridJ (2, 1)
    end if
    if blockTurn = 2 then
	assignGridJ (2, 2)
    end if
    if blockTurn = 3 then
	assignGridJ (2, 3)
    end if
    if blockTurn = 4 then
	assignGridJ (2, 4)
    end if
end moveJblock

%Procedure for moving the L piece
proc moveLblock (var tetrisGrid : array 1 .. 24, 1 .. 10 of int)
    loop
	Input.KeyDown (chars)
	%This checks depending on which block turn it is
	%this also checks if they rotate it, that the values won't go outside of the array and crash
	if chars (KEY_UP_ARROW) & blockTurn = 1 & blockY - 1 >= 1 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
	    blockTurn := 2
	elsif chars (KEY_UP_ARROW) & blockTurn = 2 & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY + 1, blockX + 1) = 0 then
	    blockTurn := 3
	elsif chars (KEY_UP_ARROW) & blockTurn = 3 & blockY - 1 >= 1 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY + 1, blockX - 1) = 0 &
		tetrisGrid (blockY, blockX - 1) = 0 then
	    blockTurn := 4
	elsif chars (KEY_UP_ARROW) & blockTurn = 4 & blockX + 1 <= 10 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 &
		tetrisGrid (blockY - 1, blockX) = 0 then
	    blockTurn := 1
	end if
	%This checks if the down arrow key is pressed and it will check if there is a block underneath so when you move it down faster, it doesnt go through something
	if chars (KEY_DOWN_ARROW) then
	    if blockTurn = 1 & not (blockY = 2| tetrisGrid (blockY - 2, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 2 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 2, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 3 & not (blockY = 1| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 4 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY, blockX - 1) not= 0) then
		blockY -= 1
	    end if
	end if
	%This checks depending on which block turn it is
	%This moves the pieces left or right depending on which arrow key was pressed and it will also check if there is another block in the way or if
	%it is hitting a wall, so the pieces don't go into other pieces or outside of the array and crash
	if blockTurn = 1 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 & tetrisGrid (blockY - 1, blockX - 2) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 2 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY - 1, blockX + 2) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY + 1, blockX - 1) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 3 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY + 1, blockX + 2) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 4 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 1 <= 10 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY + 1, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY + 1, blockX - 2) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	%This will assign the array values depending on what the blockTurn is and it will draw blocks on the screen, then erase it
	if blockTurn = 1 then
	    assignGridL (3, 1)
	    drawTetrisBlocks
	    assignGridL (0, 1)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 2 then
	    assignGridL (3, 2)
	    drawTetrisBlocks
	    assignGridL (0, 2)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 2, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 3 then
	    assignGridL (3, 3)
	    drawTetrisBlocks
	    assignGridL (0, 3)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 1| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 4 then
	    assignGridL (3, 4)
	    drawTetrisBlocks
	    assignGridL (0, 4)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY, blockX - 1) not= 0 then
		exit
	    end if
	end if
	%This delay counter is added so the Tetris pieces move slowly down the screen without making the pieces move side to side slowly
	if delayCtr >= delayAmount then
	    %This moves the block down by one
	    blockY -= 1
	    delayCtr := 0
	end if
	delayCtr += 1
	delay (85)
    end loop
    %When the procedure exits, this will assign the array values so it will stay inside the array rather than erasing it
    if blockTurn = 1 then
	assignGridL (3, 1)
    end if
    if blockTurn = 2 then
	assignGridL (3, 2)
    end if
    if blockTurn = 3 then
	assignGridL (3, 3)
    end if
    if blockTurn = 4 then
	assignGridL (3, 4)
    end if
end moveLblock

%Procedure for moving the O piece
proc moveOblock (var tetrisGrid : array 1 .. 24, 1 .. 10 of int)
    loop
	Input.KeyDown (chars)
	%This checks if the down arrow key is pressed and it will check if there is a block underneath so when you move it down faster, it doesnt go through something
	if chars (KEY_DOWN_ARROW) & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 2, blockX + 1) not= 0) then
	    blockY -= 1
	end if
	%This checks depending on which block turn it is
	%This moves the pieces left or right depending on which arrow key was pressed and it will also check if there is another block in the way or if
	%it is hitting a wall, so the pieces don't go into other pieces or outside of the array and crash
	if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX + 2) = 0 then
	    blockX += 1
	elsif chars (KEY_LEFT_ARROW) & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
	    blockX -= 1
	end if
	%This will assign the array values depending on what the blockTurn is and it will draw blocks on the screen, then erase it
	assignGridO (4)
	drawTetrisBlocks
	assignGridO (0)
	%This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	%block underneath so it doesn't go into another block
	if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 2, blockX + 1) not= 0 then
	    exit
	end if
	%This delay counter is added so the Tetris pieces move slowly down the screen without making the pieces move side to side slowly
	if delayCtr >= delayAmount then
	    %This moves the block down by one
	    blockY -= 1
	    delayCtr := 0
	end if
	delayCtr += 1
	delay (85)
    end loop
    %When the procedure exits, this will assign the array values so it will stay inside the array rather than erasing it
    assignGridO (4)
end moveOblock

%Procedure for moving the S piece
proc moveSblock (var tetrisGrid : array 1 .. 24, 1 .. 10 of int)
    loop
	Input.KeyDown (chars)
	%This checks depending on which block turn it is
	%this also checks if they rotate it, that the values won't go outside of the array and crash
	if chars (KEY_UP_ARROW) & blockTurn = 1 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
	    blockTurn := 2
	elsif chars (KEY_UP_ARROW) & blockTurn = 2 & blockX - 1 >= 1 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
	    blockTurn := 1
	end if
	%This checks if the down arrow key is pressed and it will check if there is a block underneath so when you move it down faster, it doesnt go through something
	if chars (KEY_DOWN_ARROW) then
	    if blockTurn = 1 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0| tetrisGrid (blockY - 2, blockX - 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 2 & not (blockY = 2| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 2, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	end if
	%This checks depending on which block turn it is
	%This moves the pieces left or right depending on which arrow key was pressed and it will also check if there is another block in the way or if
	%it is hitting a wall, so the pieces don't go into other pieces or outside of the array and crash
	if blockTurn = 1 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY - 1, blockX - 2) = 0 & tetrisGrid (blockY, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 2 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX + 2) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY + 1, blockX - 1) = 0 & tetrisGrid (blockY - 1, blockX) = 0 then
		blockX -= 1
	    end if
	end if
	%This will assign the array values depending on what the blockTurn is and it will draw blocks on the screen, then erase it
	if blockTurn = 1 then
	    assignGridS (5, 1)
	    drawTetrisBlocks
	    assignGridS (0, 1)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0| tetrisGrid (blockY - 2, blockX - 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 2 then
	    assignGridS (5, 2)
	    drawTetrisBlocks
	    assignGridS (0, 2)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 2, blockX + 1) not= 0 then
		exit
	    end if
	end if
	%This delay counter is added so the Tetris pieces move slowly down the screen without making the pieces move side to side slowly
	if delayCtr >= delayAmount then
	    %This moves the block down by one
	    blockY -= 1
	    delayCtr := 0
	end if
	delayCtr += 1
	delay (85)
    end loop
    %When the procedure exits, this will assign the array values so it will stay inside the array rather than erasing it
    if blockTurn = 1 then
	assignGridS (5, 1)
    end if
    if blockTurn = 2 then
	assignGridS (5, 2)
    end if
end moveSblock

%Procedure for moving the T piece
proc moveTblock (var tetrisGrid : array 1 .. 24, 1 .. 10 of int)
    loop
	Input.KeyDown (chars)
	%This checks depending on which block turn it is
	%this also checks if they rotate it, that the values won't go outside of the array and crash
	if chars (KEY_UP_ARROW) & blockTurn = 1 & blockX + 1 <= 10 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY, blockX + 1) = 0 then
	    blockTurn := 2
	elsif chars (KEY_UP_ARROW) & blockTurn = 2 & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY + 1, blockX) = 0 then
	    blockTurn := 3
	elsif chars (KEY_UP_ARROW) & blockTurn = 3 & blockY - 1 >= 1 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY, blockX - 1) = 0 then
	    blockTurn := 4
	elsif chars (KEY_UP_ARROW) & blockTurn = 4 & blockX + 1 <= 10 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX) = 0 then
	    blockTurn := 1
	end if
	%This checks if the down arrow key is pressed and it will check if there is a block underneath so when you move it down faster, it doesnt go through something
	if chars (KEY_DOWN_ARROW) then
	    if blockTurn = 1 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 2 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 3 & not (blockY = 1| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 4 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0) then
		blockY -= 1
	    end if
	end if
	%This checks depending on which block turn it is
	%This moves the pieces left or right depending on which arrow key was pressed and it will also check if there is another block in the way or if
	%it is hitting a wall, so the pieces don't go into other pieces or outside of the array and crash
	if blockTurn = 1 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 2 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY + 1, blockX - 1) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 3 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY + 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 & tetrisGrid (blockY + 1, blockX) = 0 & tetrisGrid (blockY + 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 4 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 1 <= 10 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY + 1, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	%This will assign the array values depending on what the blockTurn is and it will draw blocks on the screen, then erase it
	if blockTurn = 1 then
	    assignGridT (6, 1)
	    drawTetrisBlocks
	    assignGridT (0, 1)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 2 then
	    assignGridT (6, 2)
	    drawTetrisBlocks
	    assignGridT (0, 2)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 3 then
	    assignGridT (6, 3)
	    drawTetrisBlocks
	    assignGridT (0, 3)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 1| tetrisGrid (blockY - 1, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 4 then
	    assignGridT (6, 4)
	    drawTetrisBlocks
	    assignGridT (0, 4)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0 then
		exit
	    end if
	end if
	%This delay counter is added so the Tetris pieces move slowly down the screen without making the pieces move side to side slowly ..02
	if delayCtr >= delayAmount then
	    %This moves the block down by one
	    blockY -= 1
	    delayCtr := 0
	end if
	delayCtr += 1
	delay (85)
    end loop
    %When the procedure exits, this will assign the array values so it will stay inside the array rather than erasing it
    if blockTurn = 1 then
	assignGridT (6, 1)
    end if
    if blockTurn = 2 then
	assignGridT (6, 2)
    end if
    if blockTurn = 3 then
	assignGridT (6, 3)
    end if
    if blockTurn = 4 then
	assignGridT (6, 4)
    end if
end moveTblock

%Procedure for moving the Z piece
proc moveZblock (var tetrisGrid : array 1 .. 24, 1 .. 10 of int)
    loop
	Input.KeyDown (chars)
	%This checks depending on which block turn it is
	%this also checks if they rotate it, that the values won't go outside of the array and crash
	if chars (KEY_UP_ARROW) & blockTurn = 1 & tetrisGrid (blockY, blockX + 1) = 0 & tetrisGrid (blockY + 1, blockX + 1) = 0 & tetrisGrid (blockY - 1, blockX) = 0 then
	    blockTurn := 2
	elsif chars (KEY_UP_ARROW) & blockTurn = 2 & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY - 1, blockX) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
	    blockTurn := 1
	end if
	%This checks if the down arrow key is pressed and it will check if there is a block underneath so when you move it down faster, it doesnt go through something
	if chars (KEY_DOWN_ARROW) then
	    if blockTurn = 1 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 2, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	    if blockTurn = 2 & not (blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0) then
		blockY -= 1
	    end if
	end if
	%This checks depending on which block turn it is
	%This moves the pieces left or right depending on which arrow key was pressed and it will also check if there is another block in the way or if
	%it is hitting a wall, so the pieces don't go into other pieces or outside of the array and crash
	if blockTurn = 1 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY - 1, blockX + 2) = 0 & tetrisGrid (blockY, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 2 >= 1 & tetrisGrid (blockY, blockX - 2) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	if blockTurn = 2 then
	    if chars (KEY_RIGHT_ARROW) & blockX + 2 <= 10 & tetrisGrid (blockY, blockX + 2) = 0 & tetrisGrid (blockY + 1, blockX + 2) = 0 & tetrisGrid (blockY - 1, blockX + 1) = 0 then
		blockX += 1
	    elsif chars (KEY_LEFT_ARROW) & blockX - 1 >= 1 & tetrisGrid (blockY, blockX - 1) = 0 & tetrisGrid (blockY - 1, blockX - 1) = 0 then
		blockX -= 1
	    end if
	end if
	%This will assign the array values depending on what the blockTurn is and it will draw blocks on the screen, then erase it
	if blockTurn = 1 then
	    assignGridZ (7, 1)
	    drawTetrisBlocks
	    assignGridZ (0, 1)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX - 1) not= 0| tetrisGrid (blockY - 2, blockX + 1) not= 0 then
		exit
	    end if
	end if
	if blockTurn = 2 then
	    assignGridZ (7, 2)
	    drawTetrisBlocks
	    assignGridZ (0, 2)
	    %This checks if the Tetris piece is touching the bottom of the grid so it doesnt go outside of the array or it checks if there is a
	    %block underneath so it doesn't go into another block
	    if blockY = 2| tetrisGrid (blockY - 2, blockX) not= 0| tetrisGrid (blockY - 1, blockX + 1) not= 0 then
		exit
	    end if
	end if
	%This delay counter is added so the Tetris pieces move slowly down the screen without making the pieces move side to side slowly
	if delayCtr >= delayAmount then
	    %This moves the block down by one
	    blockY -= 1
	    delayCtr := 0
	end if
	delayCtr += 1
	delay (85)
    end loop
    %When the procedure exits, this will assign the array values so it will stay inside the array rather than erasing it
    if blockTurn = 1 then
	assignGridZ (7, 1)
    end if
    if blockTurn = 2 then
	assignGridZ (7, 2)
    end if
end moveZblock

%This procedure will assign the movement
%corrosponding to which random block was generated
proc moveRandBlock
    %This resets the block turn to the first position
    blockTurn := 1
    %Sets the blockX and blockY to the top, so it drops from the top
    blockX := 4
    blockY := 21
    delayCtr := 0
    if randBlock = 1 then
	%This generates a random block and displays it in the "Next" section
	getRandBlock
	displayRandBlock (295, 345)
	%This calls the function to move the I block
	moveIblock (tetrisGrid)
    elsif randBlock = 2 then
	%This generates a random block and displays it in the "Next" section
	getRandBlock
	displayRandBlock (295, 345)
	%This calls the function to move the J block
	moveJblock (tetrisGrid)
    elsif randBlock = 3 then
	%This generates a random block and displays it in the "Next" section
	getRandBlock
	displayRandBlock (295, 345)
	%This calls the function to move the L block
	moveLblock (tetrisGrid)
    elsif randBlock = 4 then
	%This generates a random block and displays it in the "Next" section
	getRandBlock
	displayRandBlock (295, 345)
	%This calls the function to move the O block
	moveOblock (tetrisGrid)
    elsif randBlock = 5 then
	%This generates a random block and displays it in the "Next" section
	getRandBlock
	displayRandBlock (295, 345)
	%This calls the function to move the S block
	moveSblock (tetrisGrid)
    elsif randBlock = 6 then
	%This generates a random block and displays it in the "Next" section
	getRandBlock
	displayRandBlock (295, 345)
	%This calls the function to move the T block
	moveTblock (tetrisGrid)
    elsif randBlock = 7 then
	%This generates a random block and displays it in the "Next" section
	getRandBlock
	displayRandBlock (295, 345)
	%This calls the function to move the Z block
	moveZblock (tetrisGrid)
    end if
end moveRandBlock
