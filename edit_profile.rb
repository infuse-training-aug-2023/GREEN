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
    @driver.select_option_from_dropdown(:id, "phone-code-select", "+91")
    @driver.get_element(:id, "contactNumber").clear
    @driver.send_keys(:id, "contactNumber", "1234567890")
  end

  def edit_profile_size_wear
    @driver.select_option_from_dropdown(:id, "size-select", 18070)
    # @driver.select_option_from_dropdown(:css, "div:first-child.flex-1 > div:last-child.select > select.select", 18070)
  end

  def edit_profile_height
    @driver.get_element(:id, "height").clear
    @driver.send_keys(:id, "height", 5.8)
    @driver.select_option_from_dropdown(:class, "height-unit-select", "feet")
  end

  def edit_profile_shoe_size
    @driver.select_option_from_dropdown(:css, "div:nth-child(5).d-flex.block-flex > div:last-child.flex-1 > div:last-child.select > select.select", 18124)
  end

  def edit_profile_have_children
    @driver.select_option_from_dropdown(:xpath, '//*[@id="child-select"]', 18151)
  end

  def edit_profile_current_occupation
    @driver.click(:xpath, '//label[.="Tech"]')
  end

  def edit_profile_checkbox
    # How would you describe your personal styles?
    @driver.click(:xpath, '//label[.="Formal & Polished"]')
    @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/div[7]/div[1]/div[4]/span/label')
    # What would you like to see more of from Love, Bonito?
    @driver.click(:id, "18193")
    @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/div[7]/div[2]/div[3]/label')
  end

  def complete_profile
    @driver.scroll_to(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/button')
    @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/button')
  end
end

# e = Edit_Profile.new
# e.login
# e.goto_edit_profile
# e.edit_profile_contact_number
# e.edit_profile_size_wear
# e.edit_profile_height
# e.edit_profile_shoe_size
# e.edit_profile_have_children
# e.edit_profile_current_occupation
# e.edit_profile_checkbox
# e.complete_profile
# sleep 5
# e.quit
