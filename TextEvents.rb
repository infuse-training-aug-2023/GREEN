require_relative 'Driver'

class TextEvents
    def initialize(driver, wait)
        @driver = driver
        @wait = wait
    end

    def get_element(selector, value)
        begin
          element = @driver.find_element(selector, value)
          return element
        rescue => exception
          raise "element not found"
          return nil
        end
    end

    def get_text(selector, value)
        begin
          element = @wait.until { @driver.find_element(selector, value) }
          return element.text
        rescue => exception
          raise "element not found"
          return nil
        end
      end
    
end