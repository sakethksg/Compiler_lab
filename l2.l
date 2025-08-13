%{
#include <stdio.h>
#include <string.h>

char *old_word = "old";
char *new_word = "new";
%}

%%
{old_word}     { printf("%s", new_word); }
.              { printf("%c", yytext[0]); }
\n             { printf("\n"); }
%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <input_file> <old_word> <new_word>\n", argv[0]);
        return 1;
    }
    
    old_word = argv[2];
    new_word = argv[3];
    
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error: Cannot open file %s\n", argv[1]);
        return 1;
    }
    
    yyin = file;
    yylex();
    fclose(file);
    return 0;
}