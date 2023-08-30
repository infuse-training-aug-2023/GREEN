require_relative "Login"

class Add_TO_cart < Common_flow
  def initialize
    super
    @driver = get_driver
    # @driver.set_wait(20)
    @erros = 0
  end

  def get_shopping_items
    cancel_click
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

    # sleep 10
    begin
      @driver.click(:xpath, "/html/body/div[2]/div/div[2]/div[1]/div/div[2]/div[3]/div/button[3]")
      @driver.driver.driver.save_screenshot("./error.png")
    rescue => execption
      puts "error"
      @driver.driver.driver.save_screenshot("./error.png")
    end
    puts "Added to Cart"

    # sleep 5

    # @driver.click(:class, "microcart")

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

  def cancel_click
    cross_btn = @driver.get_element(:id, "wps-ribbon-bottom-fix-close-button")
    if cross_btn.displayed?
      @driver.click(:id, "wps-ribbon-bottom-fix-close-button")
    end
  end
end

puts "Ecectuting"
add = Add_TO_cart.new
add.login
# sleep 5
# sleep 5

add.get_shopping_items

sleep 5
add.quit
