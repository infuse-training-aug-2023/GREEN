require_relative "Login"

class Edit_Profile < Common_flow
  def initialize
    super
    @driver = get_driver
    @driver.set_wait(20)
  end

  def goto_edit_profile
    sleep(5)
    @driver.click(:class, "a-account-icon")
    # @driver.click(:css, "button.sf-button.sf-button--pure.a-account-icon.my-account")
    # @driver.click(:xpath, '//*[@id="viewport"]/div[1]/div/div[2]/div[3]/div/button[2]')

    @driver.click(:link_text, "Edit Profile")
    @driver.click(:css, "button.sf-button.a-button.primary.block")
  end

  def edit_profile_contact_number
    dropdown = @driver.get_element(:id, "phone-code-select")
    select_list = Selenium::WebDriver::Support::Select.new(dropdown)
    select_list.options.each do |option|
      if option.attribute("value") == "+91"
        option.click
        break
      end
    end
    @driver.send_keys(:id, "contactNumber", "1234567890")
  end

  # def edit_profile_size_wear
  #   dropdown = @driver.get_element(:xpath, 'id("my-account")/div/div[2]/div[3]/div/div/div/div/div/form/div[4]/div[1]/div[2]/select')
  #   select_options = Selenium::WebDriver::Support::Select.new(dropdown)
  #   select_options.options.each do |option|
  #     if option.attribute("value") == "10"
  #       option.click
  #       break
  #     end
  #   end
  # end

  def edit_profile_height
    @driver.get_element(:id, "height").clear
    @driver.send_keys(:id, "height", 5.8)

    dropdown = @driver.get_element(:class, "height-unit-select")
    # @driver.click(:class, "height-unit-select")
    select_option = Selenium::WebDriver::Support::Select.new(dropdown)
    select_option.options.each do |option|
      if option.attribute("value") == "feet"
        option.click
        break
      end
    end
  end

  def edit_profile_current_occupation
    @driver.click(:xpath, '//label[.="Tech"]')
  end

  def complete_profile
    @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/button')
  end
end

e = Edit_Profile.new
e.login
e.goto_edit_profile
e.edit_profile_contact_number
e.edit_profile_height
e.edit_profile_current_occupation
e.complete_profile
sleep 10
e.quit
