require_relative "Login"

class Edit_Profile < Common_flow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(20)
  end

  def edit_profile
    @driver.click(:class, "a-account-icon")
  end
end

e = Edit_Profile.new
e.login
e.edit_profile
e.quit
