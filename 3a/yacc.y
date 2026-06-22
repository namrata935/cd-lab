%{
#include<stdio.h>
#include<stdlib.h>

int yylex();
void yyerror(char *s);
%}

%token FOR TYPE ID NUM INC DEC

%%

S : FOR1
    {
        printf("Valid 3-Level Nested FOR Loop\n");
    }
    ;

FOR1 :
    FOR '(' INIT ';' COND ';' UPDATE ')' '{' FOR2 '}'
    ;

FOR2 :
    FOR '(' INIT ';' COND ';' UPDATE ')' '{' FOR3 '}'
    ;

FOR3 :
    FOR '(' INIT ';' COND ';' UPDATE ')' '{' STMT '}'
    ;

INIT :
      TYPE ID '=' NUM
    | ID '=' NUM
    ;

COND :
      ID '<' NUM
    | ID '>' NUM
    ;

UPDATE :
      ID INC
    | ID DEC
    | ID '=' ID '+' NUM
    ;

STMT :
      ID '=' NUM ';'
    ;

%%

void yyerror(char *s)
{
    printf("Invalid FOR Loop\n");
}

int main()
{
    printf("Enter 3-Level Nested FOR Loop:\n");
    yyparse();
    return 0;
}