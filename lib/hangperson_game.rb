class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()  @guesses, and @wrong_guesses.You'll need to create getters and setters for these. H
  # end  

  attr_accessor :guesses
  attr_accessor :wrong_guesses
  attr_accessor :word


  def initialize(word)
    @word = word.downcase
    @guesses = ''
    @wrong_guesses = ''
  end
  

  
def guess(char) 
  raise ArgumentError, "invalid guess" unless char.is_a?(String) && char.length == 1 && char.match(/^[[:alpha:]]$/)
  char = char.downcase
  return false if @guesses.include?(char) || @wrong_guesses.include?(char) 
  if @word.include?(char) 
    @guesses += char
    return true
  else
    @wrong_guesses += char 
    return false
  end
end



  def word_with_guesses
    displayed_word = ""
    @word.each_char do |l|
      if @guesses.include? l 
        displayed_word += l
      else 
        displayed_word += "-"
      end
    end
    return displayed_word
  end

  def check_win_or_lose
      return :win if @word.split("").uniq.length == @guesses.length
      return :lose if @guesses.length + @wrong_guesses.length >= 7
      return :play
  end
    
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  

end
