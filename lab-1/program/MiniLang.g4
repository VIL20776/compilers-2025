// Se usan // para comentarios
grammar MiniLang; // grammar define el nombre del lenguaje geneado (nombre de los archivos y clases generadas)

prog:   stat+ ; // Se definen las reglas semánticas con expresiones de tipo E: T;
// Se pueden incluir también expresiones regulares

stat:   expr NEWLINE                 # printExpr // Se usa # para identificar ciertas producciones en el árbol sintáctico generado
    |   ID '=' expr NEWLINE          # assign // Las reglas pueden incluir literales, tokens u otras reglas
    |   NEWLINE                      # blank
    ; // Se usa | Para identificar multiples producciones

expr:   expr ('*'|'/') expr          # MulDiv
    |   expr ('+'|'-') expr          # AddSub
    |   INT                          # int
    |   ID                           # id
    |   '(' expr ')'                 # parens
    ;
// Los tokens se definen igual que las reglas semánticas
// Se definen con literales y expresiones regulares
MUL : '*' ; // define token for multiplication
DIV : '/' ; // define token for division
ADD : '+' ; // define token for addition
SUB : '-' ; // define token for subtraction
ID  : [a-zA-Z]+ ; // match identifiers
INT : [0-9]+ ; // match integers
NEWLINE:'\r'? '\n' ; // return newlines to parser (is end-statement signal)
WS  : [ \t]+ -> skip ; // toss out whitespace
// Una expresión seguida por "-> skip" descarta cualquier coincidencia con esa expresión
