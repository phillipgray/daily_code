class String
  TABLE = {
    'e' => '3',
    'o' => '0',
    'i' => '1',
    's' => 'z',
  }

  def leetspeak
    self.split(" ").map { |word|
      word.chars.map.with_index { |c, i| 
        if c == 's' && i == 0
          c
        elsif TABLE.key?(c.downcase)
          TABLE[c.downcase]
        else
          c
        end
      }.join
    }.join(" ")
  end
end
