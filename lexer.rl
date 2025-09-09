# rbs_inline: enabled
# frozen_string_literal: true

require "strscan"

module Lrama
  class Lexer
    %%{
        machine lexer;

        action start_token {
            @head_line = @line
            @head_column = @p - @head
        }

        action inc_line {
            @line += 1
            @head = @p
        }

        action token_symbol {
            return [@data[@ts...@te], Lrama::Lexer::Token::Token.new(s_value: @data[@ts...@te], location: location)]
        }

        action token_percent {
            return [@data[@ts...@te], Lrama::Lexer::Token::Token.new(s_value: @data[@ts...@te], location: location)]
        }

        action token_tag {
            return [:TAG, Lrama::Lexer::Token::Tag.new(s_value: @data[@ts...@te], location: location)]
        }

        action token_char {
            return [:CHARACTER, Lrama::Lexer::Token::Char.new(s_value: @data[@ts...@te], location: location)]
        }

        action token_str {
            return [:STRING, Lrama::Lexer::Token::Str.new(s_value: @data[@ts...@te], location: location)]
        }

        action token_int {
            return [:INTEGER, Lrama::Lexer::Token::Int.new(s_value: Integer(@data[@ts...@te]), location: location)]
        }

        action token_ident {
            token = Lrama::Lexer::Token::Ident.new(s_value: @data[@ts...@te], location: location)
            # Check if it's followed by colon to determine type
            # Save current position and check ahead
            saved_p = @p
            @p = @te
            # Skip whitespace
            while @p < @pe && (@data[@p] == ' ' || @data[@p] == '\t')
                @p += 1
            end
            # Check for colon
            if @p < @pe && @data[@p] == ':'
                type = :IDENT_COLON
            else
                type = :IDENTIFIER
            end
            @p = saved_p
            return [type, token]
        }

        action token_operator {
            return [@data[@ts...@te], Lrama::Lexer::Token::Token.new(s_value: @data[@ts...@te], location: location)]
        }

        action on_eof {
            return
        }

        # Define patterns
        newline = '\n' @inc_line;
        ws = [ \t\r]+;
        symbol = "%{" | "%}" | "%%" | '{' | '}' | '[' | ']' | '(' | ')' | ',' | ':' | '|' | ';';
        percent_token = "%union" | "%token" | "%type" | "%nterm" | "%left" | "%right" | "%nonassoc" | 
                        "%expect" | "%define" | "%require" | "%printer" | "%destructor" | "%lex-param" | 
                        "%parse-param" | "%initial-action" | "%precedence" | "%prec" | "%error-token" | 
                        "%before-reduce" | "%after-reduce" | "%after-shift-error-token" | "%after-shift" | 
                        "%after-pop-stack" | "%empty" | "%code" | "%rule" | "%no-stdlib" | "%inline" | 
                        "%locations" | "%categories" | "%start";
        tag = '<' [a-zA-Z0-9_]+ '>';
        char = "'" [^'] "'";
        escaped_char = "'\\\\'" | "'\\b'" | "'\\t'" | "'\\f'" | "'\\r'" | "'\\n'" | "'\\v'" | "'\\13'";
        string = '"' [^"]* '"';
        integer = [0-9]+;
        ident = [a-zA-Z_] [a-zA-Z0-9_-]*;
        operator = '?' | '+' | '*';
        
        comment_start = "/*";
        line_comment = "//" [^\n]* newline?;

        main := |*
            ws => { };
            newline => { };
            comment_start => { 
                # Skip multiline comments
                @p += 2
                while @p < @pe
                    if @data[@p] == '*' && @p+1 < @pe && @data[@p+1] == '/'
                        @p += 2
                        break
                    elsif @data[@p] == '\n'
                        @line += 1
                        @head = @p + 1
                    end
                    @p += 1
                end
            };
            line_comment => { 
                # Skip line comments
                @p = @te 
            };
            symbol => token_symbol;
            percent_token => token_percent;
            operator => token_operator;
            tag => token_tag;
            char => token_char;
            escaped_char => token_char;
            string => token_str;
            integer => token_int;
            ident => token_ident;
        *|;

        write data;
    }%%

    # @rbs (GrammarFile grammar_file) -> void
    def initialize(grammar_file)
      @grammar_file = grammar_file
      @data = grammar_file.text
      @p = 0
      @pe = @data.length
      @line = 1
      @head = 0
      @head_line = 1
      @head_column = 0
      @status = :initial
      @end_symbol = nil
      %% write init;
    end

    # @rbs () -> token?
    def next_token
      case @status
      when :initial
        lex_token
      when :c_declaration
        lex_c_code
      end
    end

    # @rbs () -> Integer
    def column
      @p - @head
    end

    # @rbs () -> Location
    def location
      Location.new(
        grammar_file: @grammar_file,
        first_line: @head_line, first_column: @head_column,
        last_line: @line, last_column: column
      )
    end

    # @rbs () -> lexer_token?
    def lex_token
      %% write exec;
    end

    # @rbs () -> c_token
    def lex_c_code
      # Keep the original implementation for C code
      nested = 0
      code = ''
      reset_first_position

      # Use a simple loop for C code parsing
      while @p < @pe
        case @data[@p]
        when '{'
          code += @data[@p]
          nested += 1
          @p += 1
        when '}'
          if nested == 0 && @end_symbol == '}'
            return [:C_DECLARATION, Lrama::Lexer::Token::UserCode.new(s_value: code, location: location)]
          else
            code += @data[@p]
            nested -= 1
            @p += 1
          end
        when "\n"
          code += @data[@p]
          @line += 1
          @head = @p + 1
          @p += 1
        when '"'
          # Read string literal
          start = @p
          @p += 1
          while @p < @pe && @data[@p] != '"'
            @p += 1
          end
          @p += 1 if @p < @pe
          code += @data[start...@p]
        when "'"
          # Read character literal
          start = @p
          @p += 1
          while @p < @pe && @data[@p] != "'"
            @p += 1
          end
          @p += 1 if @p < @pe
          code += @data[start...@p]
        else
          if @end_symbol && @data[@p..-1].start_with?(@end_symbol)
            return [:C_DECLARATION, Lrama::Lexer::Token::UserCode.new(s_value: code, location: location)]
          else
            code += @data[@p]
            @p += 1
          end
        end
      end
      raise ParseError, "Unexpected code: #{code}."
    end

    private

    # @rbs () -> void
    def reset_first_position
      @head_line = @line
      @head_column = @p - @head
    end
  end
end
