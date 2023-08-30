require_relative "login"

class WishList < LoginFlow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(30)
  end

  def click_item
    print "logged in\n"
    @driver.click(:class, "sf-product-card__link")
    print("\nClicked Item\n")
    original_window = @driver.driver.driver.window_handle
    @driver.driver.driver.window_handles.each do |handle|
      if handle != original_window
        @driver.driver.driver.switch_to.window handle
        print("Tab Switched\n")
        break
      end
    end
  end

  def select_size
    element = @driver.get_text(:class, "sf-button--oos")
    print("Size Selected #{element}\n")
    @driver.click(:class, "sf-button--oos")
  end

  def add_to_wish_list
    @driver.click(:class, "a-add-to-wishlist")
    print("Added to wishlist\n")
  end

  def open_wish_list
    sleep 10
    if @driver.get_element(:class, "wishlist").displayed?
      @driver.click(:class, "wishlist")
    end
  end

  def delete
    if @driver.get_element(:class, "cross-icon").displayed?
      element = @driver.get_text(:class, "sku")
      print("Found #{element}\n")
      sleep 5
      @driver.click(:class, "cross-icon")
      print("Deleting Item\n")
    end
  end

  def delete_confirm
    puts @driver.get_element(:xpath, '//span[contains(text(),"Remove")]').displayed?.to_s + "Displayed"
    if @driver.get_element(:xpath, '//span[contains(text(),"Remove")]').displayed?
      @driver.click(:xpath, '//span[contains(text(),"Remove")]')
      puts("Item deleted successfully")
    end
  end
end

# wish = WishList.new
# wish.login
# # sleep 10
# wish.click_item
# wish.select_size
# wish.add_to_wish_list
# # sleep 10
# wish.open_wish_list
# wish.delete
# wish.delete_confirm
# # sleep 10
# wish.quit
