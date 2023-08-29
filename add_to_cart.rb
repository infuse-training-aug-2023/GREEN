require_relative "Login"

class Add_TO_cart < Common_flow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(20)
    @erros = 0
  end

  def get_shopping_items
    # if @erros < 5
    #   begin
    @driver.click(:xpath, "/html/body/div[1]/div/div[2]/div[2]/div[2]/section/div/div/div/div[2]/div/div/ul/li[1]")
    # rescue RuntimeError
    #   @erros = @erros + 1
    #   p "help"
    #   get_shopping_items
    # end
    # end
  end
end

add = Add_TO_cart.new
add.login
# sleep 5
add.get_shopping_items
sleep 5
add.quit
