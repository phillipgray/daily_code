class Morse
  TABLE = Hash[*%w/
       A .-            N -.
       B -...          O ---
       C -.-.          P .--.
       D -..           Q --.-
       E .             R .-.
       F ..-.          S ...
       G --.           T -
       H ....          U ..-
       I ..            V ...-
       J .---          W .--
       K -.-           X -..-
       L .-..          Y -.--
       M --            Z --..
    /]

  def translate(english_string)
    english_string.split(" ").map { |word|
      word.chars.map { |char| TABLE[char.upcase] }.join(" ") 
      }.join(" / ")
  end
end

class MorseInterface

  def initialize(morse: Morse, stdin: STDIN)
    @morse = morse
    @stdin = stdin
  end

   def run
    puts "What would you like to translate?"
    puts @morse.new.translate(@stdin.gets.chomp)
   end
end
