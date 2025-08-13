%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int isKw(char *w) {
    char *kws[] = {"auto", "break", "case", "char", "const", "continue", "default",
                   "do", "double", "else", "enum", "extern", "float", "for", "goto",
                   "if", "int", "long", "register", "return", "short", "signed",
                   "sizeof", "static", "struct", "switch", "typedef", "union",
                   "unsigned", "void", "volatile", "while", "bool"};
    int n = sizeof(kws)/sizeof(kws[0]);
    for(int i = 0; i < n; i++) {
        if(strcmp(w, kws[i]) == 0) return 1;
    }
    return 0;
}
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*     {
                               if(isKw(yytext)) 
                                   printf("KEYWORD: %s\n", yytext);
                               else 
                                   printf("IDENTIFIER: %s\n", yytext);
                           }

[0-9]+                     { printf("CONSTANT: %s\n", yytext); }

[0-9]*\.[0-9]+             { printf("CONSTANT: %s\n", yytext); }

\"[^\"]*\"                 { printf("STRING: %s\n", yytext); }

"++"                       { printf("OPERATOR: %s\n", yytext); }
"--"                       { printf("OPERATOR: %s\n", yytext); }
"=="                       { printf("OPERATOR: %s\n", yytext); }
"!="                       { printf("OPERATOR: %s\n", yytext); }
"<="                       { printf("OPERATOR: %s\n", yytext); }
">="                       { printf("OPERATOR: %s\n", yytext); }
"&&"                       { printf("OPERATOR: %s\n", yytext); }
"||"                       { printf("OPERATOR: %s\n", yytext); }
[+\-*/=&|<>!^~]            { printf("OPERATOR: %s\n", yytext); }

[,;:(){}[\]]               { printf("PUNCTUATOR: %s\n", yytext); }

[ \t\n]                    { /* skip whitespace */ }

.                          { /* ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    FILE *file;
    
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }
    
    yyin = file;
    printf("Processing entire file content...\n");
    yylex();
    fclose(file);
    
    return 0;
}