%{
#include<stdio.h>
#include<stdlib.h>

int yylex();
void yyerror(char *s);
%}

%token TYPE ID NUM

%%

S : FUNC
    {
        printf("Valid Function Definition\n");
    }
    ;

FUNC : TYPE ID '(' PARAM ')' '{' BODY '}'
     ;

PARAM :
        TYPE ID
      | TYPE ID ',' PARAM
      |
      ;

BODY :
        STMT
      | STMT BODY
      |
      ;

STMT :
        TYPE ID ';'
      | ID '=' ID ';'
      | ID '=' NUM ';'
      ;

%%

void yyerror(char *s)
{
    printf("Invalid Function Definition\n");
}

int main()
{
    printf("Enter Function Definition:\n");
    yyparse();
    return 0;
}