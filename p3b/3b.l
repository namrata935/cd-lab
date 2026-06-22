%{
#include "y.tab.h"
#include<stdio.h>
%}

%%

"int"|"float"|"char"|"void"      { return TYPE; }

[a-zA-Z_][a-zA-Z0-9_]*           { return ID; }

[ \t\n]                          ;

.                                 { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}