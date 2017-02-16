AW PARSE

Should the executabled "awparse.out" be corrupted, compile new one with: clang awparse.tab.c lex.yy.c file_utils.c -ll -ly

Output of the .out program will be a text file called "parsedFile.txt". Text file should be deleted or renamed before running the program again

Run on Linux by command: ./awparse.out data.txt where data.txt is the file containing the active wellness log

Data remaining on the output will be:

DSP,0,d0
.
.
.
DSP,0,d39

BH3,.....
OBD,.....