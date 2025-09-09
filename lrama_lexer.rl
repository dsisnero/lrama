%%{
  machine lrama_lexer;
    
  # Character classes
  newline = '\n';  
  whitespace = [ \t\r\f\v];  
    
  # Symbols from SYMBOLS constant
  symbols = "%{" | "%}" | "%%" | '{' | '}' | '[' | ']' | '(' | ')' | ',' | ':' | '|' | ';';
    
  # Percent tokens from PERCENT_TOKENS constant
  percent_tokens = "%union" | "%token" | "%type" | "%nterm" | "%left" | "%right" |
                   "%nonassoc" | "%expect" | "%define" | "%require" | "%printer" |
                   "%destructor" | "%lex-param" | "%parse-param" | "%initial-action" |
                   "%precedence" | "%prec" | "%error-token" | "%before-reduce" |
                   "%after-reduce" | "%after-shift-error-token" | "%after-shift" |
                   "%after-pop-stack" | "%empty" | "%code" | "%rule" | "%no-stdlib" |
                   "%inline" | "%locations" | "%categories";
    
  # Other tokens
  operators = [?+*];  
  tag = '<' [a-zA-Z0-9_]+ '>';  
  character = "'" ( [^'\\] | '\\' [\\btnfrv] | '\13' ) "'";  
  string = '"' [^"]* '"';  
  integer = [0-9]+;  
  identifier = ([a-zA-Z_] | '.') ([a-zA-Z0-9_] | '.' | '-')*;  
    
  # Comments
  line_comment = "//" [^\n]*;  
  block_comment_start = "/*";  
  block_comment_end = "*/";  
    
  main := |*  
    newline => { newline };  
    whitespace+ => { # skip };  
      
    block_comment_start => { lex_comment };  
    line_comment newline? => {   
      if data[te-1] == "\n" then newline end   
    };  
      
    symbols => {   
      return [matched_string, matched_string]   
    };  
      
    percent_tokens => {   
      return [matched_string, matched_string]   
    };  
      
    operators => {   
      return [matched_string, matched_string]   
    };  
      
    tag => {   
      return [:TAG, Token::Tag.new(s_value: matched_string, location: location)]   
    };  
      
    character => {   
      return [:CHARACTER, Token::Char.new(s_value: matched_string, location: location)]   
    };  
      
    string => {   
      return [:STRING, matched_string]   
    };  
      
    integer => {   
      return [:INTEGER, Integer(matched_string)]   
    };  
      
    identifier => {   
      token = Token::Ident.new(s_value: matched_string, location: location) 
      type = lookahead_colon? ? :IDENT_COLON : :IDENTIFIER 
      return [type, token]
      };  

     *|;
}%%
  
require_relative "lexer/grammar_file"
require_relative "lexer/location"
require_relative "lexer/token"
class Lrama::Lexer  
  %% write data;  
    
  attr_reader :head_line, :head_column, :line  
  attr_accessor :status, :end_symbol  
    
  def initialize(grammar_file)  
    @grammar_file = grammar_file  
    @data = grammar_file.text  
    @head_column = @head = @p = 0  
    @head_line = @line = 1  
    @status = :initial  
    @end_symbol = nil  
    %% write init;  
  end  
    
  def next_token  
    case @status  
    when :initial  
      lex_token  
    when :c_declaration  
      lex_c_code  
    end  
  end  
    
  def lex_token  
    data = @data  
    p = @p  
    pe = data.length  
    eof = pe  
      
    %% write exec;  
      
    @p = p  
    return nil if p >= pe  
  end  
    
  def lex_c_code  
    # Implementation for C code lexing similar to original  
    nested = 0  
    code = ''  
    reset_first_position  
      
    while @p < @data.length  
      case @data[@p]  
      when '{'  
        code += @data[@p]  
        nested += 1  
        @p += 1  
      when '}'  
        if nested == 0 && @end_symbol == '}'  
          return [:C_DECLARATION, Token::UserCode.new(s_value: code, location: location)]  
        else  
          code += @data[@p]  
          nested -= 1  
          @p += 1  
        end  
      when @end_symbol  
        return [:C_DECLARATION, Token::UserCode.new(s_value: code, location: location)]  
      when '\n'  
        code += @data[@p]  
        newline  
        @p += 1  
      else  
        code += @data[@p]  
        @p += 1  
      end  
    end  
      
    raise ParseError, "Unexpected code: #{code}."  
  end  
    
  private  
    
  def matched_string  
    @data[@ts...@te]  
  end  
    
  def location  
    Location.new(  
      grammar_file: @grammar_file,  
      first_line: @head_line, first_column: @head_column,  
      last_line: @line, last_column: column  
    )  
  end  
    
  def column  
    @p - @head  
  end  
    
  def newline  
    @line += 1  
    @head = @p + 1  
  end  
    
  def reset_first_position  
    @head_line = @line  
    @head_column = column  
  end  
    
  def lookahead_colon?  
    # Check if identifier is followed by optional tag and colon  
    remaining = @data[@te..-1]  
    remaining.match?(/\A\s*(\[\s*[a-zA-Z_.][-a-zA-Z0-9_.]*\s*\])?\s*:/)  
  end  
    
  def lex_comment  
    # Block comment handling  
    while @p < @data.length  
      if @data[@p..@p+1] == '*/'  
        @p += 2  
        return  
      elsif @data[@p] == '\n'  
        newline  
        @p += 1  
      else  
        @p += 1  
      end  
    end  
  end  
end
