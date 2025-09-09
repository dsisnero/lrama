
# line 1 "lrama_lexer.rl"

# line 79 "lrama_lexer.rl"
  
  
require_relative "lexer/grammar_file"
require_relative "lexer/location"
require_relative "lexer/token"
class Lrama::Lexer  
  
# line 13 "lib/lrama/lexer.rb"
class << self
	attr_accessor :_lrama_lexer_actions
	private :_lrama_lexer_actions, :_lrama_lexer_actions=
end
self._lrama_lexer_actions = [
	0, 1, 2, 1, 5, 1, 6, 1, 
	7, 1, 8, 1, 9, 1, 10, 1, 
	11, 1, 12, 1, 13, 1, 14, 1, 
	15, 1, 16, 1, 17, 1, 18, 1, 
	19, 1, 20, 2, 0, 1, 2, 3, 
	4
]

class << self
	attr_accessor :_lrama_lexer_key_offsets
	private :_lrama_lexer_key_offsets, :_lrama_lexer_key_offsets=
end
self._lrama_lexer_key_offsets = [
	0, 0, 1, 16, 17, 18, 19, 20, 
	21, 24, 25, 26, 27, 28, 29, 30, 
	31, 32, 33, 34, 35, 36, 37, 38, 
	39, 40, 41, 42, 43, 44, 45, 46, 
	47, 48, 49, 50, 51, 52, 53, 54, 
	55, 56, 57, 58, 59, 61, 62, 63, 
	64, 65, 66, 67, 68, 69, 70, 71, 
	73, 74, 75, 76, 77, 78, 79, 80, 
	81, 82, 85, 86, 87, 88, 89, 90, 
	91, 92, 93, 95, 96, 97, 98, 99, 
	100, 101, 102, 103, 104, 105, 107, 109, 
	110, 111, 112, 113, 114, 115, 116, 117, 
	118, 119, 120, 121, 123, 125, 126, 127, 
	128, 129, 130, 131, 132, 133, 134, 135, 
	136, 137, 138, 140, 141, 142, 143, 145, 
	146, 147, 148, 149, 150, 151, 152, 155, 
	156, 157, 158, 159, 160, 161, 162, 164, 
	165, 166, 168, 169, 177, 178, 180, 186, 
	193, 221, 225, 226, 227, 235, 236
]

class << self
	attr_accessor :_lrama_lexer_trans_keys
	private :_lrama_lexer_trans_keys, :_lrama_lexer_trans_keys=
end
self._lrama_lexer_trans_keys = [
	34, 37, 97, 98, 99, 100, 101, 105, 
	108, 110, 112, 114, 116, 117, 123, 125, 
	102, 116, 101, 114, 45, 112, 114, 115, 
	111, 112, 45, 115, 116, 97, 99, 107, 
	101, 100, 117, 99, 101, 104, 105, 102, 
	116, 101, 114, 114, 111, 114, 45, 116, 
	111, 107, 101, 110, 101, 102, 111, 114, 
	101, 45, 114, 97, 111, 116, 101, 103, 
	111, 114, 105, 101, 115, 100, 101, 102, 
	115, 105, 110, 116, 114, 117, 99, 116, 
	111, 114, 109, 114, 120, 112, 116, 121, 
	112, 101, 99, 116, 110, 105, 108, 116, 
	105, 97, 108, 45, 97, 99, 116, 105, 
	111, 101, 111, 102, 120, 45, 112, 97, 
	114, 97, 109, 99, 97, 116, 105, 111, 
	110, 111, 116, 45, 110, 115, 116, 100, 
	108, 105, 98, 97, 115, 115, 111, 99, 
	101, 114, 97, 114, 114, 115, 101, 101, 
	105, 99, 100, 101, 110, 110, 116, 101, 
	101, 105, 117, 113, 117, 105, 114, 103, 
	104, 108, 111, 121, 112, 110, 39, 92, 
	39, 49, 92, 98, 102, 110, 114, 116, 
	118, 51, 42, 47, 48, 57, 65, 90, 
	97, 122, 62, 48, 57, 65, 90, 97, 
	122, 10, 32, 34, 37, 39, 44, 46, 
	47, 60, 63, 91, 93, 9, 13, 40, 
	41, 42, 43, 48, 57, 58, 59, 65, 
	90, 97, 122, 123, 125, 9, 32, 11, 
	13, 45, 101, 45, 46, 48, 57, 65, 
	90, 97, 122, 10, 48, 57, 0
]

class << self
	attr_accessor :_lrama_lexer_single_lengths
	private :_lrama_lexer_single_lengths, :_lrama_lexer_single_lengths=
end
self._lrama_lexer_single_lengths = [
	0, 1, 15, 1, 1, 1, 1, 1, 
	3, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 2, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 2, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 3, 1, 1, 1, 1, 1, 1, 
	1, 1, 2, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 2, 2, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 2, 2, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 2, 1, 1, 1, 2, 1, 
	1, 1, 1, 1, 1, 1, 3, 1, 
	1, 1, 1, 1, 1, 1, 2, 1, 
	1, 2, 1, 8, 1, 2, 0, 1, 
	12, 2, 1, 1, 0, 1, 0
]

class << self
	attr_accessor :_lrama_lexer_range_lengths
	private :_lrama_lexer_range_lengths, :_lrama_lexer_range_lengths=
end
self._lrama_lexer_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 3, 3, 
	8, 1, 0, 0, 4, 0, 1
]

class << self
	attr_accessor :_lrama_lexer_index_offsets
	private :_lrama_lexer_index_offsets, :_lrama_lexer_index_offsets=
end
self._lrama_lexer_index_offsets = [
	0, 0, 2, 18, 20, 22, 24, 26, 
	28, 32, 34, 36, 38, 40, 42, 44, 
	46, 48, 50, 52, 54, 56, 58, 60, 
	62, 64, 66, 68, 70, 72, 74, 76, 
	78, 80, 82, 84, 86, 88, 90, 92, 
	94, 96, 98, 100, 102, 105, 107, 109, 
	111, 113, 115, 117, 119, 121, 123, 125, 
	128, 130, 132, 134, 136, 138, 140, 142, 
	144, 146, 150, 152, 154, 156, 158, 160, 
	162, 164, 166, 169, 171, 173, 175, 177, 
	179, 181, 183, 185, 187, 189, 192, 195, 
	197, 199, 201, 203, 205, 207, 209, 211, 
	213, 215, 217, 219, 222, 225, 227, 229, 
	231, 233, 235, 237, 239, 241, 243, 245, 
	247, 249, 251, 254, 256, 258, 260, 263, 
	265, 267, 269, 271, 273, 275, 277, 281, 
	283, 285, 287, 289, 291, 293, 295, 298, 
	300, 302, 305, 307, 316, 318, 321, 325, 
	330, 351, 355, 357, 359, 364, 366
]

class << self
	attr_accessor :_lrama_lexer_trans_targs
	private :_lrama_lexer_trans_targs, :_lrama_lexer_trans_targs=
end
self._lrama_lexer_trans_targs = [
	144, 1, 144, 3, 37, 44, 54, 65, 
	73, 85, 99, 114, 126, 134, 136, 144, 
	144, 0, 4, 0, 5, 0, 6, 0, 
	7, 0, 8, 0, 9, 17, 22, 0, 
	10, 0, 11, 0, 12, 0, 13, 0, 
	14, 0, 15, 0, 16, 0, 144, 0, 
	18, 0, 19, 0, 20, 0, 21, 144, 
	144, 144, 23, 0, 24, 0, 25, 0, 
	146, 0, 27, 144, 28, 144, 29, 144, 
	30, 144, 31, 144, 32, 144, 33, 144, 
	34, 144, 35, 144, 36, 144, 144, 144, 
	38, 0, 39, 0, 40, 0, 41, 0, 
	42, 0, 43, 0, 17, 0, 45, 53, 
	0, 46, 0, 47, 0, 48, 0, 49, 
	0, 50, 0, 51, 0, 52, 0, 144, 
	0, 21, 0, 55, 0, 56, 58, 0, 
	57, 0, 21, 0, 59, 0, 60, 0, 
	61, 0, 62, 0, 63, 0, 64, 0, 
	144, 0, 66, 28, 69, 0, 67, 0, 
	68, 0, 144, 0, 70, 0, 71, 0, 
	72, 0, 144, 0, 74, 0, 75, 56, 
	0, 76, 0, 77, 0, 78, 0, 79, 
	0, 80, 0, 81, 0, 82, 0, 83, 
	0, 84, 0, 36, 0, 86, 93, 0, 
	72, 87, 0, 88, 0, 89, 0, 90, 
	0, 91, 0, 92, 0, 144, 0, 94, 
	0, 95, 0, 96, 0, 97, 0, 98, 
	0, 52, 0, 100, 112, 0, 101, 107, 
	0, 102, 0, 103, 0, 104, 0, 105, 
	0, 106, 0, 144, 0, 108, 0, 109, 
	0, 110, 0, 111, 0, 144, 0, 113, 
	0, 92, 0, 115, 118, 0, 116, 0, 
	117, 0, 87, 0, 119, 123, 0, 147, 
	0, 121, 144, 122, 144, 20, 144, 124, 
	0, 125, 0, 64, 0, 127, 131, 133, 
	0, 128, 0, 129, 0, 130, 0, 21, 
	0, 132, 0, 72, 0, 21, 0, 34, 
	135, 0, 21, 0, 83, 0, 0, 139, 
	138, 144, 0, 140, 138, 138, 138, 138, 
	138, 138, 138, 0, 138, 0, 144, 149, 
	0, 143, 143, 143, 0, 144, 143, 143, 
	143, 0, 144, 145, 1, 2, 137, 144, 
	148, 141, 142, 144, 144, 144, 145, 144, 
	144, 150, 144, 148, 148, 144, 0, 145, 
	145, 145, 144, 26, 144, 120, 144, 148, 
	148, 148, 148, 144, 144, 149, 150, 144, 
	144, 144, 144, 144, 144, 144, 144, 144, 
	144, 144, 144, 144, 144, 144, 144, 144, 
	144, 144, 144, 144, 144, 144, 0
]

class << self
	attr_accessor :_lrama_lexer_trans_actions
	private :_lrama_lexer_trans_actions, :_lrama_lexer_trans_actions=
end
self._lrama_lexer_trans_actions = [
	19, 0, 9, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 9, 
	9, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 11, 0, 
	0, 0, 0, 0, 0, 0, 0, 33, 
	11, 33, 0, 0, 0, 0, 0, 0, 
	38, 0, 0, 31, 0, 31, 0, 33, 
	0, 33, 0, 33, 0, 33, 0, 33, 
	0, 33, 0, 33, 0, 33, 11, 33, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 11, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	11, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 11, 0, 0, 0, 0, 0, 
	0, 0, 11, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 11, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 11, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 11, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 38, 
	0, 0, 31, 0, 31, 0, 31, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 17, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 5, 0, 
	0, 0, 0, 0, 0, 15, 0, 0, 
	0, 0, 3, 0, 0, 0, 0, 9, 
	0, 0, 0, 13, 9, 9, 0, 9, 
	13, 0, 9, 0, 0, 9, 0, 0, 
	0, 0, 21, 0, 25, 0, 25, 0, 
	0, 0, 0, 29, 7, 0, 0, 27, 
	33, 33, 31, 31, 33, 33, 33, 33, 
	33, 33, 33, 33, 33, 31, 31, 31, 
	21, 25, 25, 29, 23, 27, 0
]

class << self
	attr_accessor :_lrama_lexer_to_state_actions
	private :_lrama_lexer_to_state_actions, :_lrama_lexer_to_state_actions=
end
self._lrama_lexer_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	35, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_lrama_lexer_from_state_actions
	private :_lrama_lexer_from_state_actions, :_lrama_lexer_from_state_actions=
end
self._lrama_lexer_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	1, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_lrama_lexer_eof_trans
	private :_lrama_lexer_eof_trans, :_lrama_lexer_eof_trans=
end
self._lrama_lexer_eof_trans = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 381, 381, 0, 0, 
	0, 0, 384, 384, 381, 381, 381, 381, 
	381, 381, 381, 381, 381, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	384, 384, 384, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 385, 387, 387, 388, 389, 390
]

class << self
	attr_accessor :lrama_lexer_start
end
self.lrama_lexer_start = 144;
class << self
	attr_accessor :lrama_lexer_first_final
end
self.lrama_lexer_first_final = 144;
class << self
	attr_accessor :lrama_lexer_error
end
self.lrama_lexer_error = 0;

class << self
	attr_accessor :lrama_lexer_en_main
end
self.lrama_lexer_en_main = 144;


# line 86 "lrama_lexer.rl"
    
  attr_reader :head_line, :head_column, :line  
  attr_accessor :status, :end_symbol  
    
  def initialize(grammar_file)  
    @grammar_file = grammar_file  
    @data = grammar_file.text  
    @head_column = @head = @p = 0  
    @head_line = @line = 1  
    @status = :initial  
    @end_symbol = nil  
    
# line 390 "lib/lrama/lexer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = lrama_lexer_start
	ts = nil
	te = nil
	act = 0
end

# line 98 "lrama_lexer.rl"
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
      
    
# line 419 "lib/lrama/lexer.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_acts = _lrama_lexer_from_state_actions[cs]
	_nacts = _lrama_lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _lrama_lexer_actions[_acts - 1]
			when 2 then
# line 1 "NONE"
		begin
ts = p
		end
# line 453 "lib/lrama/lexer.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _lrama_lexer_key_offsets[cs]
	_trans = _lrama_lexer_index_offsets[cs]
	_klen = _lrama_lexer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _lrama_lexer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _lrama_lexer_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _lrama_lexer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _lrama_lexer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _lrama_lexer_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	end
	if _goto_level <= _eof_trans
	cs = _lrama_lexer_trans_targs[_trans]
	if _lrama_lexer_trans_actions[_trans] != 0
		_acts = _lrama_lexer_trans_actions[_trans]
		_nacts = _lrama_lexer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _lrama_lexer_actions[_acts - 1]
when 3 then
# line 1 "NONE"
		begin
te = p+1
		end
when 4 then
# line 49 "lrama_lexer.rl"
		begin
act = 6;		end
when 5 then
# line 37 "lrama_lexer.rl"
		begin
te = p+1
 begin  newline();  end
		end
when 6 then
# line 40 "lrama_lexer.rl"
		begin
te = p+1
 begin  lex_comment();  end
		end
when 7 then
# line 41 "lrama_lexer.rl"
		begin
te = p+1
 begin    
      if (data[te-1] == '\n') newline();   
     end
		end
when 8 then
# line 45 "lrama_lexer.rl"
		begin
te = p+1
 begin    
      return [matched_string(), matched_string()];   
     end
		end
when 9 then
# line 49 "lrama_lexer.rl"
		begin
te = p+1
 begin    
      return [matched_string(), matched_string()];   
     end
		end
when 10 then
# line 53 "lrama_lexer.rl"
		begin
te = p+1
 begin    
      return [matched_string(), matched_string()];   
     end
		end
when 11 then
# line 57 "lrama_lexer.rl"
		begin
te = p+1
 begin    
      return [:TAG, Token::Tag.new(s_value: matched_string(), location: location())];   
     end
		end
when 12 then
# line 61 "lrama_lexer.rl"
		begin
te = p+1
 begin    
      return [:CHARACTER, Token::Char.new(s_value: matched_string(), location: location())];   
     end
		end
when 13 then
# line 65 "lrama_lexer.rl"
		begin
te = p+1
 begin    
      return [:STRING, matched_string()];   
     end
		end
when 14 then
# line 38 "lrama_lexer.rl"
		begin
te = p
p = p - 1; begin  /* skip */  end
		end
when 15 then
# line 41 "lrama_lexer.rl"
		begin
te = p
p = p - 1; begin    
      if (data[te-1] == '\n') newline();   
     end
		end
when 16 then
# line 49 "lrama_lexer.rl"
		begin
te = p
p = p - 1; begin    
      return [matched_string(), matched_string()];   
     end
		end
when 17 then
# line 69 "lrama_lexer.rl"
		begin
te = p
p = p - 1; begin    
      return [:INTEGER, Integer(matched_string())];   
     end
		end
when 18 then
# line 73 "lrama_lexer.rl"
		begin
te = p
p = p - 1; begin    
      token = Token::Ident.new(s_value: matched_string(), location: location());  
      type = lookahead_colon? ? :IDENT_COLON : :IDENTIFIER;  
      return [type, token];   
     end
		end
when 19 then
# line 49 "lrama_lexer.rl"
		begin
 begin p = ((te))-1; end
 begin    
      return [matched_string(), matched_string()];   
     end
		end
when 20 then
# line 1 "NONE"
		begin
	case act
	when 0 then
	begin	begin
		cs = 0
		_trigger_goto = true
		_goto_level = _again
		break
	end
end
	when 6 then
	begin begin p = ((te))-1; end
   
      return [matched_string(), matched_string()];   
    end
end 
			end
# line 663 "lib/lrama/lexer.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _lrama_lexer_to_state_actions[cs]
	_nacts = _lrama_lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _lrama_lexer_actions[_acts - 1]
when 0 then
# line 1 "NONE"
		begin
ts = nil;		end
when 1 then
# line 1 "NONE"
		begin
act = 0
		end
# line 688 "lib/lrama/lexer.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _lrama_lexer_eof_trans[cs] > 0
		_trans = _lrama_lexer_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 116 "lrama_lexer.rl"
      
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
