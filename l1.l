%{
#include <stdio.h>
#include <string.h>
int count = 0;
char word[100];
%}

%%

[a-zA-Z]+   { 
    if (strcmp(yytext, word) == 0) {
        count++; 
    }
}
.|\n       

%%

int main() {
    printf("Enter word to search: ");
    scanf("%s", word);
    
    FILE *file = fopen("input.txt", "r");
    if (file) {
        yyin = file;
        yylex();
        fclose(file);
        printf("Word '%s' found %d times\n", word, count);
    } else {
        printf("Cannot open input.txt\n");
    }
    
    return 0;
}

int yywrap() {
    return 1;
}