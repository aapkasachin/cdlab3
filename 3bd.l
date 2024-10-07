%{
#include "y.tab.h"
%}

%%
"for" {return FOR;}
"("  {return LPAREN;}
")"  {return RPAREN;}
"{"  {return LF;}
"}"  {return RF;}
"="  {return '=';}
"+"  {return '+';}
"-"  {return '-';}
">"  {return '>';};
"<"  {return '<';};
";"  {return ';';};
"==" {return EQ;}
">=" {return GE;}
"<=" {return LE;}
"+=" {return ADD_ASSIGN;};
"-=" {return SUB_ASSIGN;};
"++" {return INC;}
"--" {return DEC;}
[0-9]+ {return NUM;}
[a-zA-Z]+ {return EXP;}
. { }
\n { return 0;}
%%

int yywrap()
{
   return 1;
}
