%{
#include<stdio.h>
int posfrac = 0 , negfrac = 0 , posint = 0 , negint = 0;
%}
num      [0-9]+
posnum   \+?{num}\.{num}+|\+?\.{num}+
negnum   -{num}\.{num}+|-\.{num}+
%%
-{num}"/"-{num}      { posfrac++; }
-{num}"/"{num}       { negfrac++; }
{num}"/"-{num}       { negfrac++; }
\+?{num}"/"{num}     { posfrac++; }

{negnum}             { negfrac++; }
{posnum}             { posfrac++; }

-{num}               { negint++; }
\+?{num}             { posint++; }

[ \t\n]+             ;
.                    ;
%%
int main()
{
    printf("Enter the string : \n");
    yylex();
    printf("Positive integers : %d\n",posint);
    printf("Negative integers : %d\n",negint);
    printf("Positive fractions : %d\n",posfrac);        
    printf("Negative fractions : %d\n",negfrac);
    return 0;
}
int yywrap()
{
    return 1;
}