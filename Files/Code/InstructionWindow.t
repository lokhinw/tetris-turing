%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Lokhin Wu
%Program Name: Tetris
%Date: December 12, 2016
%Course:  ICS3CU1  Final Project 15%
%Teacher:  M. Ianni
%Descriptions:  Tetris game programmed in Turing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Display Intstruction

proc displayInstructionWindow

    cls
    %Draws this instruction picture
    Pic.Draw (InstructionScreen, 0, 0, picCopy)
    %Waits for any key to be pressed
    %Once a key is pressed, the game starts
    var anyKey : string (1)
    getch (anyKey)

end displayInstructionWindow
