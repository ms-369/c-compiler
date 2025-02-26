%{
#include <stdio.h>
%}

/* Define token patterns */
PACKAGE     package[ \t\n;(){}]
FUNC        func[ \t\n;(){}]
INTTYPE     int[ \t\n;(){}]
VOID        void[ \t\n;(){}]
RETURN      return[ \t\n;(){}]
ID          [a-zA-Z_][a-zA-Z0-9_]*  
CONSTANT    [0-9]+  
LPAREN      \(  
RPAREN      \)  
LCB         \{  
RCB         \}  
SEMICOLON   ;  
WHITESPACE  [ \t\n]+  

%%
{PACKAGE}   { printf("T_PACKAGE %s\n", yytext); }
{FUNC}      { printf("T_FUNC %s\n", yytext); }
{INTTYPE}   { printf("T_INTTYPE %s\n", yytext); }
{VOID}      { printf("T_VOID %s\n", yytext); }
{RETURN}    { printf("T_RETURN %s\n", yytext); }
{ID}        { printf("T_ID %s\n", yytext); }
{CONSTANT}  { printf("T_CONSTANT %s\n", yytext); }
{LPAREN}    { printf("T_LPAREN %s\n", yytext); }
{RPAREN}    { printf("T_RPAREN %s\n", yytext); }
{LCB}       { printf("T_LCB %s\n", yytext); }
{RCB}       { printf("T_RCB %s\n", yytext); }
{SEMICOLON} { printf("T_SEMICOLON %s\n", yytext); }
{WHITESPACE} { printf("T_WHITESPACE\n"); } 
.           { printf("Unknown token: %s\n", yytext); }

%%
int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
