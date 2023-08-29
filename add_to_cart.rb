require_relative "Login"

class Add_TO_cart < Common_flow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(20)
  end

  def get_shopping_items
    # @driver.driver.driver.action.scroll_to(@driver.get_element(:xpath, "/html/body/div[1]/div/div[2]/div[2]/div[2]/section/div/div/div/div[2]/div/div/ul/li[1]")).perform
    @driver.click(:xpath, "/html/body/div[1]/div/div[2]/div[2]/div[2]/section/div/div/div/div[2]/div/div/ul/li[1]")
  end
end

add = Add_TO_cart.new
add.login
sleep 5
add.get_shopping_items
sleep 5
add.quit
