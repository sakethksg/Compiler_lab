%{
#include <stdio.h>
#include <string.h>

int max_length = 0;
char longest_word[1000];
%}

%%
[a-zA-Z]+   {
                int current_length = strlen(yytext);
                if (current_length > max_length) {
                    max_length = current_length;
                    strcpy(longest_word, yytext);
                }
            }
[ \t\n]+    ;
.           ;
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    
    if (max_length > 0) {
        printf("Longest word: \"%s\"\n", longest_word);
        printf("Length: %d\n", max_length);
    } else {
        printf("No words found.\n");
    }
    
    return 0;
}