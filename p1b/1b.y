%{
    #include<stdio.h>
    #include <string.h>
    #include <stdlib.h>
    void yyerror(char const*s);
    int yylex();
%}
%start S
%%
S: A B;
A: 'a'A'b' 
 |
 ;
B: 'b' B 'c'
 |
 ;
%%
int main(){
    printf("enter the string:\n");
    yyparse();
    printf("valid\n");
    return 0;
}
void yyerror(char const*s){
    fprintf(stderr, "invalid\n");
    exit(0);
}