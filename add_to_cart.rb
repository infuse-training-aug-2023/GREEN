require_relative "Login"

class Add_TO_cart < Common_flow
  def initialize
    super
    @driver = get_driver
  end
end

add = Add_TO_cart.new
add.login
add.quit
