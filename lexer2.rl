%%{
  #
  # Lexer for Lrama written in Ragel (Ruby backend).
  # This file is intended to generate Ruby source code that
  # behaves identically to the existing `lib/lrama/lexer.rb`
  # produced from `lrama_lexer.rl`.
  #
  # You can compile it with:
  #   ragel -R lexer2.rl -o lib/lrama/lexer.rb
  #

  machine lrama_lexer;

  alphtype char;

  # -------------------------------------------------------------------
  # Character classes
  # -------------------------------------------------------------------
  newline     = '\n';
  whitespace  = [ \t\r\f\v];

  # -------------------------------------------------------------------
  # Symbols and keywords
  # -------------------------------------------------------------------
  symbols =
      "%{" | "%}" | "%%" |
      '{' | '}' | '[' | ']' | '(' | ')' |
      ',' | ':' | '|' | ';';

  percent_tokens =
      "%union" | "%token" | "%type" | "%nterm" | "%left" | "%right" |
      "%nonassoc" | "%expect" | "%define" | "%require" | "%printer" |
      "%destructor" | "%lex-param" | "%parse-param" | "%initial-action" |
      "%precedence" | "%prec" | "%error-token" | "%before-reduce" |
      "%after-reduce" | "%after-shift-error-token" | "%after-shift" |
      "%after-pop-stack" | "%empty" | "%code" | "%rule" | "%no-stdlib" |
      "%inline" | "%locations" | "%categories";

  # -------------------------------------------------------------------
  # Other tokens
  # -------------------------------------------------------------------
  operators   = [?+*];
  tag         = '<' [a-zA-Z0-9_]+ '>';
  character   = "'" ( [^'\\] | '\\' [\\btnfrv] | '\\13' ) "'";
  string      = '"' ( [^"\\] | '\\' . )* '"';
  integer     = [0-9]+;
  identifier  = ([a-zA-Z_] | '.') ([a-zA-Z0-9_] | '.' | '-')*;

  # -------------------------------------------------------------------
  # Comments
  # -------------------------------------------------------------------
  line_comment        = "//" [^\n]*;
  block_comment_start = "/*";
  block_comment_end   = "*/";

  # -------------------------------------------------------------------
  # Actions
  # -------------------------------------------------------------------
  action skip              { }      # ignore token
  action do_newline        { newline }
  action emit_sym          { return [matched_string, matched_string] }
  action emit_tag          { return [:TAG, Token::Tag.new(s_value: matched_string, location: location)] }
  action emit_char         { return [:CHARACTER, Token::Char.new(s_value: matched_string, location: location)] }
  action emit_str          { return [:STRING, matched_string] }
  action emit_int          { return [:INTEGER, Integer(matched_string)] }
  action emit_ident        {
    token = Token::Ident.new(s_value: matched_string, location: location)
    type  = lookahead_colon? ? :IDENT_COLON : :IDENTIFIER
    return [type, token]
  }
  action consume_comment   { }      # handled in Ruby helper

  # -------------------------------------------------------------------
  # Main state machine
  # -------------------------------------------------------------------
  main :=
      newline              => do_newline
    | whitespace+          => skip
    | block_comment_start  => { lex_comment }
    | line_comment newline?=> do_newline
    | symbols              => emit_sym
    | percent_tokens       => emit_sym
    | operators            => emit_sym
    | tag                  => emit_tag
    | character            => emit_char
    | string               => emit_str
    | integer              => emit_int
    | identifier           => emit_ident
  ;
}%%

# ---------------------------------------------------------------------
# Host language (Ruby) part
# ---------------------------------------------------------------------
require_relative "lib/lrama/lexer/grammar_file"
require_relative "lib/lrama/lexer/location"
require_relative "lib/lrama/lexer/token"

class Lrama::Lexer
  %% write data;

  attr_reader :head_line, :head_column, :line
  attr_accessor :status, :end_symbol

  def initialize(grammar_file)
    @grammar_file = grammar_file
    @data         = grammar_file.text
    @head_column  = @head = @p = 0
    @head_line    = @line = 1
    @status       = :initial
    @end_symbol   = nil
    %% write init;
  end

  # -----------------------------------------------------------------
  # Public API
  # -----------------------------------------------------------------
  def next_token
    case @status
    when :initial       then lex_token
    when :c_declaration then lex_c_code
    end
  end

  # -----------------------------------------------------------------
  # Ragel-driven lexing
  # -----------------------------------------------------------------
  def lex_token
    data = @data
    p    = @p
    pe   = data.length
    eof  = pe

    %% write exec;

    @p = p
    return nil if p >= pe
  end

  # -----------------------------------------------------------------
  # Manual C-code block lexer (same as original)
  # -----------------------------------------------------------------
  def lex_c_code
    nested = 0
    code   = +""
    reset_first_position

    while @p < @data.length
      case @data[@p]
      when '{'
        code << @data[@p]
        nested += 1
        @p += 1
      when '}'
        if nested.zero? && @end_symbol == '}'
          return [:C_DECLARATION, Token::UserCode.new(s_value: code, location: location)]
        else
          code << @data[@p]
          nested -= 1
          @p += 1
        end
      when @end_symbol
        return [:C_DECLARATION, Token::UserCode.new(s_value: code, location: location)]
      when "\n"
        code << @data[@p]
        newline
        @p += 1
      else
        code << @data[@p]
        @p += 1
      end
    end

    raise ParseError, "Unexpected code: #{code}."
  end

  # -----------------------------------------------------------------
  # Helper methods
  # -----------------------------------------------------------------
  private

  def matched_string
    @data[@ts...@te]
  end

  def location
    Location.new(
      grammar_file: @grammar_file,
      first_line:   @head_line,  first_column: @head_column,
      last_line:    @line,       last_column: column
    )
  end

  def column
    @p - @head
  end

  def newline
    @line += 1
    @head  = @p + 1
  end

  def reset_first_position
    @head_line   = @line
    @head_column = column
  end

  def lookahead_colon?
    remaining = @data[@te..-1]
    remaining.match?(/\A\s*(\[\s*[a-zA-Z_.][-a-zA-Z0-9_.]*\s*\])?\s*:/)
  end

  # Inline comment lexer invoked from Ragel action
  def lex_comment
    while @p < @data.length
      if @data[@p, 2] == '*/'
        @p += 2
        return
      elsif @data[@p] == "\n"
        newline
        @p += 1
      else
        @p += 1
      end
    end
  end
end
