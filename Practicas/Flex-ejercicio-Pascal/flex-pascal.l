%{
	#include<stdio.h>	
%}

DIGIT	[0-9]
ID	[a-z][a-z0-9]*

%%

{DIGIT}+								{printf("ENTERO %s (%d)\n",yytext,atoi(yytext));}
{DIGIT}+"."{DIGIT}*						{printf("FLOAT: %s (%g)\n",yytext,atof(yytext));}
if|then|begin|end|procedure|function	{printf("PALABRA RESERVADA: %s\n",yytext);}
{ID}									{printf("IDENTIFICADOR: %s\n",yytext);}
"+"|"-"|"*"|"/"							{printf("OPERADOR: %s\n",yytext);}
"{"[^{}\n]*"}"							/*expresion para comentarios*/
[\t\n]+									/*expresion para espacios en blanco*/
.										{printf("NO ES RECONOCIDO: %s\n",yytext);}

%%

int main (int argc, char **argv)
{
	++argv, --argc; /*Ignora el nombre del programa*/

	if(argc>0){
		yyin=fopen(argv[0],"r");
	}else{
		yyin=stdin;
	}

	yylex();
}
