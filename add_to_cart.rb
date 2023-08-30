require_relative "Login"

class Add_TO_cart < Common_flow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(20)
    @erros = 0
    @erros = 0
  end

  def get_shopping_items
    puts "clicking on item"
    @driver.click(:class, "sf-product-card__link")
    # sleep 5

    original_window = @driver.driver.driver.window_handle

    @driver.driver.driver.window_handles.each do |handle|
      if handle != original_window
        @driver.driver.driver.switch_to.window handle
        break
      end
    end
    @driver.click(:class, "sf-button--oos-")
puts "Clicked on size"
    @driver.click(:class, "a-add-to-cart")
    loop do
      added = @driver.get_text(:class, "a-add-to-cart")
      if added == "ADD TO BAG"
        break
      end
    end
    puts "Added to Cart" 
    @driver.click(:class, "microcart")
    puts "Confirming added to Cart"
    check_added
  end

  def check_added
    arr = @driver.get_text(:class, "cart-header").split
    items = arr[3].chars[1].to_i
    if items > 0
      puts "Added to Cart Succsessfully"
    else
      puts "Failed TO add TO cart"
    end
  end
end

add = Add_TO_cart.new
add.login
# sleep 5
# sleep 5
add.get_shopping_items

# sleep 5
add.quit
