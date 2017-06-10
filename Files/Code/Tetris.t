%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Lokhin Wu
%Program Name: Tetris
%Date: December 12, 2016
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Tetris game programmed in Turing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%This process plays the Tetris theme song when forked
process playTheme
    Music.PlayFileLoop ("Sounds/TetrisTheme.mp3")
end playTheme

%This procedure draws the outline of the Tetris board
%score, difficulty and the outline for the 'Next Piece' box
proc drawBoardOutline
    Pic.Draw (TetrisGameBG, 0, 0, picCopy)
    Draw.FillBox (26, 26, 226, 426, 54)
    %This draws the outline of the Tetris board
    Draw.Box (226, 426, 25, 25, 0)
    %This draws the outline for the 'Next Piece' box
    Draw.Box (250, 426, 400, 300, 0)
    %This draws the outline for the 'Info' box (Difficulty and Score)
    Draw.Box (250, 276, 400, 25, 0)
    %This draws the difficulty inside the 'Info' Box
    Font.Draw (difficulty, 260, 95, impact30, 0)
    %This draws the score inside the 'Info' box
    Font.Draw (intstr (score), 270, 195, impact30, 0)
end drawBoardOutline

%This generates a random Tetris block
proc getRandBlock
    %Generates a randon number between 1 and 7. Each number represents a different block
    randBlock := Rand.Int (1, 7)
end getRandBlock

%This procedure checks if a row is filled,
%and will clear it, and update the array if it is
proc checkRowFilled
    %Initalize a boolean variable to see if a row is filled
    var rowFilled : boolean := true
    for rows : 1 .. upper (tetrisGrid, 1) - 4
	%Set the rowFilled variable back to true everytime a new row is checked
	rowFilled := true
	for cols : 1 .. upper (tetrisGrid, 2)
	    %If a row contains a 0, that means it is not full, it will set the rowFilled to false,
	    %otherwise the row is filled and rowFilled will stay as true
	    if tetrisGrid (rows, cols) = 0 then
		rowFilled := false
		exit
	    end if
	end for
	%If the row is filled, it sets the current row to all 0 (empty row)
	if rowFilled = true then
	    for i : 1 .. upper (tetrisGrid, 2)
		tetrisGrid (rows, i) := 0
	    end for
	    %Then it rearranges the array. From the rowFilled to the last row minus one
	    for j : rows .. upper (tetrisGrid, 1) - 5
		for k : 1 .. upper (tetrisGrid, 2)
		    %This sets the current row values to the row on top's values
		    tetrisGrid (j, k) := tetrisGrid (j + 1, k)
		end for
	    end for
	    if difficulty = "EASY" then
		%Add 100 to score if the difficulty is easy
		score += 100
	    elsif difficulty = "MEDIUM" then
		%Add 200 to score if the difficulty is medium
		score += 200
	    elsif difficulty = "HARD" then
		%Add 300 to score if the difficulty is hard
		score += 300
	    end if
	    %It recalls the procedure to see if there are any other rows that were filled
	    checkRowFilled
	end if
    end for
end checkRowFilled

%This procedure checks if the Tetris pieces go
%outside of the array (if there is an array value
%that is not 0 in rows 21 to 24)
proc checkGameOver
    %This checks for the rows that are above 20.
    %If the values are not 0 meaning there are blocks above the top, it will set gameOver to be true
    %The main.t loop exits when gameOver = true, and it will exit the game
    for rows : 21 .. upper (tetrisGrid, 1)
	for cols : 1 .. upper (tetrisGrid, 2)
	    if tetrisGrid (rows, cols) not= 0 then
		gameOver := true
	    end if
	end for
    end for
end checkGameOver

%this will display your score and it will save it into a text file: scores.txt
proc displayAndSaveScore
%This opens the "Scores.txt" file and seeks, so it does not override the current data inside thee text file
    open : stream, "Files/Text/Scores.txt", put, mod, seek
    seek : stream, *
    if stream > 0 then
	put : stream, score
	close : stream
    end if
    %This will display the score you got and then ask for a key to continues
    Font.Draw ("YOUR SCORE", 115, 300, impact30, 0)
    Font.Draw (intstr (score), 165, 250, impact30, 0)
    var anyKey : string (1)
    Font.Draw ("PRESS ANY KEY", 95, 200, impact30, 0)
    Font.Draw ("TO CONTINUE", 110, 150, impact30, 0)
    getch (anyKey)
end displayAndSaveScore

%This procedure loads the scores from a text file, "Scores.txt" into an array. It sorts the array via bubble sort and then it displays the top 5 highest scores
proc displayHighScores
    %This is the position of where the scores will be drawn, it decreases by 40 each time, so it doesnt overlap
    var scorePosCtr : int := 300
    %This is the variable to store how many scores are inside the text file
    var totalScores : int := 0
    %This is used for the bubble sorting
    var tempVar : int
    cls
    Pic.Draw (TetrisBG, 0, 0, picCopy)
    Font.Draw ("HIGHSCORES", 100, 385, impact30, 0)
    %This counts how many scores are inside the "Scores.txt"
    open : stream, "Files/Text/Scores.txt", get
    if stream > 0 then
	loop
	    get : stream, skip
	    exit when eof (stream)
	    get : stream, streamScore
	    totalScores += 1
	end loop
	close : stream
    else
	put "Scores.txt file is missing!"
    end if
    if totalScores > 0 then
	%This makes an array the size of 1 to the total amount of scores inside the "Scores.txt"
	%After, it will load all the scores that are inside the "Scores.txt" file inside the highScores array
	var highScores : array 1 .. totalScores of int
	open : stream, "Files/Text/Scores.txt", get
	if stream > 0 then
	    for i : 1 .. totalScores
		get : stream, skip
		exit when eof (stream)
		get : stream, highScores (i)
	    end for
	    close : stream
	else
	    put "Scores.txt file is missing!"
	end if
	%This uses bubble sort to sort the scores from highest to lowest inside the highScores array
	for i : 1 .. totalScores - 1
	    for j : 1 .. totalScores - 1
		if highScores (j) < highScores (j + 1) then
		    tempVar := highScores (j)
		    highScores (j) := highScores (j + 1)
		    highScores (j + 1) := tempVar
		end if
	    end for
	end for
	%This checks if there are 5 or more scores inside the array.
	%If yes, it will draw the top 5 highest scores inside the array
	if upper (highScores) >= 5 then
	    for i : 1 .. 5
		Font.Draw (intstr (highScores (i)), 165, scorePosCtr, impact30, 0)
		scorePosCtr -= 40
	    end for
	    %If there are less than 5 scores, it will display the amount there is inside the array
	    %This checker exists, so the program doesnt crash if there arent at least 5 scores inside the array
	elsif upper (highScores) < 5 then
	    for i : 1 .. upper (highScores)
		Font.Draw (intstr (highScores (i)), 165, scorePosCtr, impact30, 0)
		scorePosCtr -= 40
	    end for
	end if
    end if
end displayHighScores
