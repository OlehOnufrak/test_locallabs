require 'pry'

class TestLocallabs

  attr_reader :test_sentence_1, :test_sentence_2

  def initialize
    @test_sentence_1 = "County Clerk/Recorder/DeKalb County"
    @test_sentence_2 = "1st circuit judge, Circuit Court"
  end

  def i_task
    right_sentence = []
    slice = @test_sentence_1.split(' ').uniq.last
    first_word = slice.split('/').last
    second_word = @test_sentence_1.split(' ').first
    third_part = slice.gsub(first_word, '/').split('/').join(' and ').downcase
    right_sentence << first_word << second_word << third_part
    result = right_sentence.join(' ')
    p result
  end

  def ii_task
    test_words = "Alderman/Chicago"
    regex = /(?<![,\\\/\p{L}])\p{L}+/;
    result = test_words.gsub(regex) { |word| word.downcase }
  end
  
  def iii_task
    p ii_task
    test_words = ii_task
    result = test_words.split('/').reverse.join(' ')
    p result
  end

  def iv_task
    without_parenthesis = @test_sentence_2.split(', ').last
    in_parenthesis = "(#{without_parenthesis})"
    result = @test_sentence_2.gsub(without_parenthesis, in_parenthesis)
    p result
  end

  def v_task
    abbr = "Twp" 
    full_word = "Township"
    result = abbr.gsub(abbr, full_word)
    p result
  end

  def vi_task
    abbr = "Hwy"
    full_word = "Highway"
    full_word.scan(/[aeiou]/).count > 0 ? p(full_word) : p(abbr.gsub(abbr, full_word))
  end

  def vii_task
    words = %w[Highway highway Hwy hwy]
    right_word = []
    words.each { |word| right_word << word if word.eql?(words[0]) }
    p right_word.join
  end

  def viii_task
    sentence = "Something Township."
    result = sentence.downcase.gsub('.', '')
    puts result
  end
end

test_locallabs = TestLocallabs.new
test_locallabs.i_task
test_locallabs.ii_task
test_locallabs.iii_task
test_locallabs.iv_task
test_locallabs.v_task
test_locallabs.vi_task
test_locallabs.vii_task
test_locallabs.viii_task



