require_relative "login"

class AddToCart < LoginFlow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(30)
  end

  def get_shopping_items
    close_popup
    puts "clicking on item"
    @driver.click(:class, "sf-product-card__link")

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

    @driver.click(:xpath, "/html/body/div[2]/div/div[2]/div[1]/div/div[2]/div[3]/div/button[3]")
    puts "Added to Cart"
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

  def close_popup
    if @driver.get_element(:id, "wps-ribbon-bottom-fix-close-button").displayed?
      @driver.click(:id, "wps-ribbon-bottom-fix-close-button")
    end
  end
end

# add = AddToCart.new
# add.login
# add.get_shopping_items
# add.quit
