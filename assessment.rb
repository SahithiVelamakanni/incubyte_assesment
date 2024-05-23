
# calculator_with_tests.rb
require 'test/unit'

class CalculatorSevice
  def add(numbers)
    if numbers.is_a?(String)
        result_array = numbers.split(",")
        sum = result_array.collect{|v| v.to_i}.inject(0,:+)
        print("Sum = #{sum}")
        return sum
    else
        puts numbers
        return "Entered input is not a string"
        
    end
  end

end

class TestCalculator < Test::Unit::TestCase
  def setup
    @calculator = CalculatorSevice.new
  end

  def test_add
    assert_equal(8, @calculator.add("3, 5"))
    assert_equal(0, @calculator.add("-1, 1"))
    assert_equal("Entered input is not a string", @calculator.add(0))
  end
end

# Run the tests
TestCalculator.run
