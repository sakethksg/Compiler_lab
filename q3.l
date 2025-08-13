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

int main() {
    char s[1000];
    FILE *file;

    printf("Enter statement: ");
    fgets(s, sizeof(s), stdin);
    
    // Remove newline character
    s[strcspn(s, "\n")] = '\0';
    
    // Store input to file
    file = fopen("input.txt", "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return 1;
    }
    fprintf(file, "%s", s);
    fclose(file);
    
    printf("\nInput stored in 'input.txt'. Processing...\n\n");
    
    // Open file for lex processing
    file = fopen("input.txt", "r");
    if (file == NULL) {
        printf("Error opening file for processing!\n");
        return 1;
    }
    
    yyin = file;
    yylex();
    fclose(file);
    
    return 0;
}