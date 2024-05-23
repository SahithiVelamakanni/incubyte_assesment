# Service Class
class StringCalculatorRuby
    def initialize(param)
      @param = param
    end
    
    def add(numbers)
        
    
    end
  end
  
  # Test Class
  require 'minitest/autorun'
  
  class TestYourService < Minitest::Test

    def test_perform_method_should_double_input
      service = YourService.new(5)
      result = service.perform
      
      assert_equal 10, result
    end
  end
  