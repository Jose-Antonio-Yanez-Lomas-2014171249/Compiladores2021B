%{
	  #include<stdio.h>
    #include<stdlib.h>
    #include"polaca.tab.h"	
%}

NUMERO [0-9]+

%%
{NUMERO}+              {yylval.fl = atof(yytext); 
                        return (NUM);}
"-"					{return (-);}
"+"                 {return (+);}
"*"					{return (*);}
"/"					{return (/);}
"^"				    {return (^);}
"\n"				{return (\n);}
%%
int main(){
    yylex();
    return 0;
}
