%{
#include<stdio.h>

int pos_int = 0, neg_int = 0;
int pos_frac = 0, neg_frac = 0;
%}

num      [0-9]+
posnum   \+?{num}\.{num}+|\+?\.{num}+
negnum   -{num}\.{num}+|-\.{num}+

%%

-{num}"/"-{num}      { pos_frac++; }

-{num}"/"{num}       { neg_frac++; }

{num}"/"-{num}       { neg_frac++; }

\+?{num}"/"{num}     { pos_frac++; }

{negnum}             { neg_frac++; }

{posnum}             { pos_frac++; }

-{num}               { neg_int++; }

\+?{num}             { pos_int++; }

[ \t\n]+             ;

.                    ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter numbers:\n");
    yylex();

    printf("\nPositive Integers = %d\n", pos_int);
    printf("Negative Integers = %d\n", neg_int);
    printf("Positive Fractions = %d\n", pos_frac);
    printf("Negative Fractions = %d\n", neg_frac);

    return 0;
}