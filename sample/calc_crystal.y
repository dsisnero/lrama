/*
 * How to build and run for Crystal:
 *
 * $ lrama -S template/crystal/yacc.cr -o calc.cr sample/calc_crystal.y && crystal build calc.cr && ./calc
 * 1
 * => 1
 * 1+2*3
 * => 7
 * (1+2)*3
 * => 9
 *
 */

%{
  # Crystal code for the parser
%}

%code provides {
  def yylex : Int32
  def yyerror(message : String) : Nil
}

%union {
  # In Crystal, we don't need a union in the same way as C.
  # We'll use a struct for yylval, but note: the generated code uses YYSTYPE which is a struct.
  # For simplicity, we'll just define val as an Int32.
  # Actually, the generated code will define YYSTYPE as a struct with a val field of type Int32.
}

%token LF
%token <val> NUM
%type <val> expr
%left '+' '-'
%left '*' '/'

%locations

%rule %inline op    : '+' { :+ }
                    | '-' { :- }
                    | '*' { :* }
                    | '/' { :/ }
                    ;

%%

list : /* empty */
     | list LF
     | list expr LF { puts "=> #{$2}" }
     ;
expr : NUM
  | expr '+' expr { $1 + $3 }
  | expr '-' expr { $1 - $3}
  | expr '*' expr { $1 * $3}
  | expr '/' expr { $1 / $3}
     | '(' expr ')'  { $$ = $2 }
     ;

%crystal-inner {
def yylex : Int32
  c = STDIN.getc
  case c
  when ' ', '\t'
    return yylex
  when '0'..'9'
    num = c - '0'
    while (c = STDIN.getc) && '0' <= c <= '9'
      num = num * 10 + (c - '0')
    end
    STDIN.ungetc(c) if c
    @yylval.val = num
    return 4 # NUM
  when '\n'
    return 3 # LF
  when '+', '-', '*', '/', '(', ')'
    return c.ord
  when nil
    return 0 # YYEOF
  else
    yyerror("Unexpected character: #{c}")
    return yylex
  end
end


def yyerror(message : String) : Nil
  STDERR.puts "Error: #{message}"
end

def run
  puts "Enter expressions (Ctrl-D to exit):"
  yyparse
end
}

%crystal-footer {
parser = Yacc::Parser.new
parser.run
}
