require 'to_words/version'

module ToWords
  class Ordinal
    SMALL_CONVERSION = [
      'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 
      'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
      'sixteen', 'seventeen', 'eighteen', 'nineteen'
    ]

    TENS_PLACE_CONVERSION = [
      '', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy',
      'eighty', 'ninety'
    ]

    def initialize(value)
      @value = value
    end

    def hundreds_digit
      (@value % 1000) / 100
    end

    def tens_digit
      (@value % 100) / 10
    end

    def ones_digit
      @value % 10
    end

    def ordinalize_two_digit_value(leftover)

      if leftover % 10 == 0 && leftover > 19 
        ("#{TENS_PLACE_CONVERSION[tens_digit]}")
      elsif leftover > 19
        ("#{TENS_PLACE_CONVERSION[tens_digit]} #{SMALL_CONVERSION[ones_digit]}")
      else
        if leftover == 0
          "zero"
        else
          ("#{SMALL_CONVERSION[leftover]}") 
        end
      end

    end

    def to_str
      num_string = ""
      if @value > 99
        num_string += "#{SMALL_CONVERSION[hundreds_digit]} hundred"
        leftover = @value - (hundreds_digit * 100)
      else
        leftover = @value
      end

      num_string.concat(" ") if @value > 100 && @value % 100 != 0
      num_string.concat ordinalize_two_digit_value(leftover) if @value % 100 > 0
      num_string     
    end

    def self.from_integer(num)
      Ordinal.new(num)
    end
  end
end
