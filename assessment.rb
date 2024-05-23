# Service Class
class StringCalculator
    def add(numbers)
      if numbers.is_a?(String)
        numbers_array = numbers.split(",").map(&:to_i)
        numbers_array.inject(0, :+)
      else
        "Value Entered is not a String"
      end
    end
  end
  
  # Test Class
  require 'minitest/autorun'
  
  class TestStringCalculator < Minitest::Test
    def setup
      @calculator = StringCalculator.new
    end
  
    def test_add_method_should_add_the_string
      result = @calculator.add("1,2,3")
      assert_equal 6, result
    end
  
    def test_add_method_should_return_zero_for_empty_string
      result = @calculator.add("")
      assert_equal 0, result
    end
  
    def test_add_method_should_return_error_message_for_non_string_input
      result = @calculator.add(1)
      assert_equal "Value Entered is not a String", result
    end
  
    def test_add_method_should_ignore_negative_numbers
      result = @calculator.add("1,2,-3")
      assert_equal 3, result
    end
  end
  