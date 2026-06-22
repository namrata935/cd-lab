%{
#include<stdio.h>
#include<stdlib.h>

int yylex();
void yyerror();
%}

%token NUM

%left '+' '-'
%left '*' '/'

%%

S : E { printf("Result = %d\n", $1); };

E : E '+' E   { $$ = $1 + $3; }
  | E '-' E   { $$ = $1 - $3; }
  | E '*' E   { $$ = $1 * $3; }
  | E '/' E   {
                    if($3 == 0)
                        yyerror();
                    else
                        $$ = $1 / $3;
               }
  | '(' E ')' { $$ = $2; }
  | NUM        { $$ = $1; }
  ;

%%

int main()
{
    printf("Enter expression:\n");
    yyparse();
    return 0;
}

void yyerror()
{
    printf("Invalid Expression\n");
    exit(0);
}