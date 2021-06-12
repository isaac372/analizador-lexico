package analizadores;

import java_cup.runtime.Symbol;
%%
%class YylexLexico
%cup
%{
  private int comment_count = 0;
%} 
%line
%char
%state COMMENT
%init{ 
    yyline = 1; 
    yychar = 1; 
%init} 
ALPHA=[A-Za-z]
DIGIT=[0-9]
IDENTIFICADOR={ALPHA}({ALPHA}|{DIGIT}|_)*
NONNEWLINE_WHITE_SPACE_CHAR=[\ \t\b\012]
WHITE_SPACE_CHAR=[\n\ \t\b\012]
STRING_TEXT=(\\\"|[^\n\"]|\\{WHITE_SPACE_CHAR}+\\)*
COMMENT_TEXT=([^/*\n]|[^*\n]"/"[^*\n]|[^/\n]"*"[^/\n]|"*"[^/\n]|"/"[^*\n])*
%%
{ALPHA} {
	return (new Symbol(sym.CADENATEXTO,new String(yytext())));
}	

{IDENTIFICADOR} {
	return (new Symbol(sym.IDENTIFICADOR,new String(yytext())));
}	



";" { return new Symbol(sym.PTOCOMA); }
"+" { return new Symbol(sym.SUMA); }
"*" { return new Symbol(sym.TIMES); }
"(" { return new Symbol(sym.LPAREN); }
")" { return new Symbol(sym.RPAREN); }
"," { return new Symbol(sym.COMA); }
":" { return new Symbol(sym.DOSPTO); }
"[" { return new Symbol(sym.ABRECORCHETE); }
"]" { return new Symbol(sym.CIERRACORCHETE); }
"{" { return new Symbol(sym.INICIOLLAVE); }
"}" { return new Symbol(sym.FINLLAVE); }
"." { return new Symbol(sym.PTO); }
"-" { return new Symbol(sym.RESTA); }
"=" { return new Symbol(sym.IGUAL); }
"<>" { return new Symbol(sym.DISTINTO); }
"<"  { return new Symbol(sym.MENOR); }
"<=" { return new Symbol(sym.MENORIGUAL); }
">"  { return new Symbol(sym.MAYOR); }
">=" { return new Symbol(sym.MAYORIGUAL); }
"&"  { return new Symbol(sym.AND); }
"|"  { return new Symbol(sym.OR); }
"while" { return new Symbol(sym.WHILE);}
"set" { return new Symbol(sym.SET); }
"puts" { return new Symbol(sym.PUTS); }
"if" { return new Symbol(sym.IF);}
"else" { return new Symbol(sym.ELSE);}

[0-9]+ { return new Symbol(sym.NUMBER, new Integer(yytext())); }

[ \t\r\n\f] { /* ignore white space. */ }
. { System.err.println("Illegal character: "+yytext()); }
<COMMENT> {COMMENT_TEXT} { }



