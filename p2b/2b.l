%{
#include "2b.tab.h"
#include<stdlib.h>
%}

%%

[0-9]+        { yylval = atoi(yytext); return NUM; }

[+\-*/()]     { return yytext[0]; }

\n            { return 0; }

[ \t]         ;

%%

int yywrap()
{
    return 1;
}