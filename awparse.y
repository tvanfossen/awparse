/*Created by: Tristan VanFossen 2-16-2017*/

%{
#include <stdio.h>
#include <stdlib.h>
#include "file_utils.h"

extern FILE *yyin;
%}

%union{
	char *sValue;
}

%start file
%token DSP
%type<sValue> DSP
%token OBD
%type<sValue> OBD
%token BH
%type<sValue> BH

%%
file:		expr
	|	expr file

expr:		obdexpr
	|	dspexpr
	|	bhexpr
;

obdexpr:	OBD	{FILE * fp = fopen ("parsedFile.txt","a"); fputs($1, fp);fputc('\n',fp); fclose(fp);}
;

dspexpr:	DSP	{FILE * fp = fopen ("parsedFile.txt","a"); fputs($1, fp);fputc('\n',fp); fclose(fp);}
;

bhexpr:		BH	{FILE * fp = fopen ("parsedFile.txt","a"); fputs($1, fp);fputc('\n',fp); fclose(fp);}
;

%%

int main (int argc, char ** argv)
{
	char * inputFile = *(argv+1);
	FILE * fp = fopen(inputFile, "r");

	yyin = fp;
	do{
		yyparse();
	}while (!feof(yyin));
}
