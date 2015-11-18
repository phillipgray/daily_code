class Morse
  MORSE_TABLE = {"A"=>".-", "N"=>"-.", "B"=>"-...", "O"=>"---", "C"=>"-.-.", "P"=>".--.", "D"=>"-..", "Q"=>"--.-", "E"=>".", "R"=>".-.", "F"=>"..-.", "S"=>"...", "G"=>"--.", "T"=>"-", "H"=>"....", "U"=>"..-", "I"=>"..", "V"=>"...-", "J"=>".---", "W"=>".--", "K"=>"-.-", "X"=>"-..-", "L"=>".-..", "Y"=>"-.--", "M"=>"--", "Z"=>"--.."}
  
  def translate(english_string)
    english_string.split(" ").map { |word|
      word.chars.map { |char| MORSE_TABLE[char.upcase] }.join(" ")
    }.join(" / ")
  end
end
