/*Created by: Tristan VanFossen 2-16-2017*/

%{
#include <stdio.h>
#include "awparse.tab.h"
%}

DSP [0-9]{13},DSP,0,d[0-9]{1,2},.*
OBD [0-9]{13},OBD,.*
BH  [0-9]{13},BH3,.*

%%
{DSP}		yylval.sValue = strdup (yytext); return DSP;
{OBD}		yylval.sValue = strdup (yytext); return OBD;
{BH}		yylval.sValue = strdup (yytext); return BH;
%%
