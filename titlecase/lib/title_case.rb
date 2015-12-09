class String
  define_method(:title_case) do
    word_list = self.split
    lowercase_words = ['and', 'the', 'of', 'or', 'but', 'in']
    word_list.each_with_index do |word, i|
      word.downcase!
      word.capitalize! if not lowercase_words.include?(word) && i != 0
    end
    word_list.join(" ")
  end
end