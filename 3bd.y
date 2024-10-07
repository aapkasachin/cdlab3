%{
   #include<stdio.h>
   #include<stdlib.h>
   #include<string.h>
   int yylex();
   void yyerror(char *s);
   int count=0;
%}

%start S
%token FOR LPAREN RPAREN LF RF NUM EXP 
%token EQ GE LE ADD_ASSIGN SUB_ASSIGN INC DEC

%%
S:I
 ;
I:FOR A B {count++;}
 ;
A:LPAREN E ';' E ';' E RPAREN
 ;
E:EXP Z EXP
 |EXP Z NUM
 |EXP U
 |
 ;
Z:'='
 |'>'
 |'<'
 |EQ
 |GE
 |LE
 |ADD_ASSIGN
 |SUB_ASSIGN
 ;
U:INC
 |DEC
 ;
B:LF B RF
 |EXP
 |I
 |EXP I
 |
 ;
%%

int main()
{
    printf("enter the expression:\n");
    yyparse();
    printf("the number of for loop levels:%d",count);
    return 0;
}

void yyerror(char *s)
{
   fprintf(stderr,"error -> %s",s);
   exit(0);
}

