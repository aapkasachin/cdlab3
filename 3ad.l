%{
#include<stdio.h>
#include<string.h>
int cl=0;
%}

%%
"//".*[\n]? {cl++;fprintf(yyout," ");}
"/*"[^*]*"*/" {cl++;fprintf(yyout," ");}
. {fprintf(yyout,yytext);}
%%

int main()
{
   yyin=fopen("3_in.c","r");
   yyout=fopen("3_out.c","w");
   yylex();
   printf("the number of comment lines are %d",cl);
   fclose(yyin);
   fclose(yyout);
   return 0;
}
