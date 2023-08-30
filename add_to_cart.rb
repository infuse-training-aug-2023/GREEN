require_relative "Login"

class Add_TO_cart < Common_flow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(20)
    @erros = 0
  end

  def get_shopping_items
    puts "clicking on item"
    @driver.click(:class, "sf-product-card__link")
    cancel_click
    # sleep 5

    original_window = @driver.driver.driver.window_handle

    @driver.driver.driver.window_handles.each do |handle|
      if handle != original_window
        @driver.driver.driver.switch_to.window handle
        break
      end
    end
    cancel_click
    @driver.click(:class, "sf-button--oos-")
    cancel_click
    puts "Clicked on size"
    @driver.click(:class, "a-add-to-cart")
    cancel_click
    loop do
      added = @driver.get_text(:class, "a-add-to-cart")
      if added == "ADD TO BAG"
        break
      end
    end
    puts "Added to Cart" 
    @driver.click(:class, "microcart")
    cancel_click
    puts "Confirming added to Cart"
    check_added
  end

  def check_added
    arr = @driver.get_text(:class, "cart-header").split
    cancel_click
    items = arr[3].chars[1].to_i
    if items > 0
      puts "Added to Cart Succsessfully"
    else
      puts "Failed TO add TO cart"
    end
  end

  def cancel_click
    cross_btn = @driver.get_element(:id,"wps-ribbon-bottom-fix-close-button")
    if cross_btn.displayed?
      @driver.click(:id,"wps-ribbon-bottom-fix-close-button")
    end
  end
  
end
puts "Ecectuting"
add = Add_TO_cart.new
add.login
# sleep 5
# sleep 5
add.get_shopping_items

# sleep 5
add.quit
