# Service Class
class StringCalculator
    def add(numbers)
      raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)
  
      numbers_array = numbers.split(",").map(&:to_i)
      handle_negative_numbers(numbers_array)
      numbers_array.inject(0, :+)
    end
  
    private
  
    def handle_negative_numbers(numbers)
      negative_numbers = numbers.select { |num| num < 0 }
      raise ArgumentError, "Negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?
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
  
    def test_add_method_should_raise_error_for_non_string_input
      assert_raises(ArgumentError) { @calculator.add(1) }
    end
  
    def test_add_method_should_raise_error_for_negative_numbers
      exception = assert_raises(ArgumentError) { @calculator.add("1,2,-3") }
      assert_equal "Negative numbers not allowed: -3", exception.message
    end
  end
  