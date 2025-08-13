%{
#include <stdio.h>
%}

%%

[0-9]+          { printf("NUMBER: %s\n", yytext); }
[a-zA-Z]+       { printf("WORD: %s\n", yytext); }
"+"             { printf("PLUS\n"); }
"-"             { printf("MINUS\n"); }
"*"             { printf("MULTIPLY\n"); }
"/"             { printf("DIVIDE\n"); }
"="             { printf("ASSIGN\n"); }
"("             { printf("LPAREN\n"); }
")"             { printf("RPAREN\n"); }
";"             { printf("SEMICOLON\n"); }
[ \t]           { /* ignore whitespace */ }
\n              { /* ignore newlines */ }
.               { printf("UNKNOWN: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}