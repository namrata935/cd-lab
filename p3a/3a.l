%{
#include "y.tab.h"
#include<stdio.h>
%}

%%

"for"                           { return FOR; }

"int"|"char"|"float"            { return TYPE; }

"++"                            { return INC; }
"--"                            { return DEC; }

[0-9]+                          { return NUM; }

[a-zA-Z_][a-zA-Z0-9_]*          { return ID; }

[ \t\n]                         ;

.                               { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}