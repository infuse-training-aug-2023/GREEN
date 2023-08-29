require_relative "Login"

class Add_TO_cart < Common_flow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(20)
  end

  def get_shopping_items
    @driver.click(:class_name, "sf-product-card")
  end
end

add = Add_TO_cart.new
add.login
add.get_shopping_items
add.quit
