# Se importa la librería de sistema, toda la librería de antlr4 y las clases
# MiniLangLexer y MiniLangParser generadas por la herramienta de antlr
import sys
from antlr4 import *
from MiniLangLexer import MiniLangLexer
from MiniLangParser import MiniLangParser

def main(argv):
    input_stream = FileStream(argv[1]) # Se lee un archivo como input
    lexer = MiniLangLexer(input_stream) # Se lee el archivo de entrada y se genera un lexer
    stream = CommonTokenStream(lexer) # Se obtienen los tokens del archivo de entrada
    parser = MiniLangParser(stream) # Se genera el arbol sintáctico de los token recibidos
    tree = parser.prog()  # We are using 'prog' since this is the starting rule based on our MiniLang grammar, yay!
    # Se empieza a recorrer el árbol sintáctico desde la raíz

if __name__ == '__main__':
    main(sys.argv)
