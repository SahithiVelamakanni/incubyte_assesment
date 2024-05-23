# Service Class
class StringCalculatorRuby
    def initialize
    end
    
    def add(numbers)
        if numbers.is_a?(String)
            array = numbers.split(",")
            result = 0
            array.each do |b|
                result = result+b.to_i
            end
            return result
        else
            return "Value Entered is not a String"
        end
    
    end
  end
  
  # Test Class
  require 'minitest/autorun'
  
  class TestYourService < Minitest::Test

    def test_add_method_should_add_the_string
      service = StringCalculatorRuby.new
      result = service.add("1,2,3")
      
      assert_equal 6, result
    end
    
    def test_add_method_should_add_the_string_2
        service = StringCalculatorRuby.new
        result = service.add(1)
        
        assert_equal "Value Entered is not a String", result
      end
  end
  