require_relative '../array_average'
require 'test/unit'

class SimpleTest < Test::Unit::TestCase
  def test_array_average_can_be_called
    assert_equal(array_average([1]), 1)
  end

  def test_array_average_calculates
    assert_equal array_average([1, 3]), 2
  end

  # but what about edge cases?!

  def test_average_of_empty_array_returns_zero
    assert_equal array_average([]), 0
  end

  def test_average_of_array_non_integer
    assert_equal array_average([1, 2]), 1.5
  end

end