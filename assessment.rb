# Service Class
class StringCalculator
    def add(numbers)
      raise ArgumentError, "Input must be a string" unless numbers.is_a?(String)
      numbers_array = extract_numbers(numbers)
      handle_negative_numbers(numbers_array)
      numbers_array.sum
    end
  
    private
  
    def extract_numbers(numbers)
      delimiter = default_delimiter(numbers)
      numbers.split(delimiter_regex(delimiter)).map(&:to_i)
    end
  
    def default_delimiter(numbers)
      numbers.start_with?("//") ? custom_delimiter(numbers) : /[,\n]/
    end
  
    def custom_delimiter(numbers)
      numbers.slice!(0, 2)
      numbers.split("\n", 2)[0]
    end
  
    def delimiter_regex(delimiter)
      Regexp.new("#{delimiter}|[\n]")
    end
  
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
      assert_equal 6, @calculator.add("1,2,3")
    end
  
    def test_add_method_should_return_zero_for_empty_string
      assert_equal 0, @calculator.add("")
    end
  
    def test_add_method_should_test_with_other_delimiters
      assert_equal 3, @calculator.add("//,\n1,\t2")
    end
  
    def test_add_method_should_also_pass_new_line_delimiter
      assert_equal 11, @calculator.add("1,2\n8")
    end
  
    def test_add_method_should_raise_error_for_non_string_input
      assert_raises(ArgumentError) { @calculator.add(1) }
    end
  
    def test_add_method_should_raise_error_for_negative_numbers
      exception = assert_raises(ArgumentError) { @calculator.add("1,2,-3") }
      assert_equal "Negative numbers not allowed: -3", exception.message
    end
  end
  