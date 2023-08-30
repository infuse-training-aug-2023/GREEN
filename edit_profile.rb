require_relative "Login"

class Edit_Profile < Common_flow
  def initialize
    super
    @driver = get_driver
    # @driver.set_wait(30)
  end

  def goto_edit_profile
    sleep(5)
    # Pop up
    if @driver.get_element(:id, "wps-ribbon-bottom-fix-close-button").displayed?
      @driver.click(:id, "wps-ribbon-bottom-fix-close-button")
    end

    @driver.click(:css, "button.sf-button.sf-button--pure.a-account-icon.my-account")
    # @driver.click(:xpath, '//*[@id="viewport"]/div[1]/div/div[2]/div[3]/div/button[2]')
    # @driver.click(:class, "a-account-icon")

    @driver.click(:link_text, "Edit Profile")

    @driver.click(:css, "button.sf-button.a-button.primary.block")
    # @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/button')
    # @driver.click(:xpath, '//*[contains(text(),"Edit Profile")]')
  end

  def edit_profile_contact_number
    @driver.select_options(:id, "phone-code-select", :value, "+91")
    @driver.get_element(:id, "contactNumber").clear
    @driver.send_keys(:id, "contactNumber", "1234567890")
  end

  def edit_profile_size_wear
    @driver.select_options(:id, "size-select", :value, "18070")
  end

  def edit_profile_height
    @driver.get_element(:id, "height").clear
    @driver.send_keys(:id, "height", 5.8)
    @driver.select_options(:class, "height-unit-select", :value, "feet")
  end

  def edit_profile_shoe_size
    @driver.select_options(:css, "div:nth-child(5).d-flex.block-flex > div:last-child.flex-1 > div:last-child.select > select.select", :value, "18124")
  end

  def edit_profile_have_children
    @driver.select_options(:xpath, '//*[@id="child-select"]', :value, "18151")
  end

  def edit_profile_current_occupation
    @driver.click(:xpath, '//label[.="Tech"]')
  end

  def edit_profile_checkbox
    # How would you describe your personal styles?
    @driver.click(:xpath, '//label[.="Formal & Polished"]')
    @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/div[7]/div[1]/div[4]/span/label')
    # What would you like to see more of from Love, Bonito?
    @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/div[7]/div[2]/div[2]/label')
    @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/div[7]/div[2]/div[3]/label')
  end

  def complete_profile
    @driver.scroll_to(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/button')
    @driver.click(:xpath, '//*[@id="my-account"]/div/div[2]/div[3]/div/div/div/div/div/form/button')
  end

  def display_profile_after_changes
    sleep 5
    profile_details = @driver.get_element(:id, "profile-details")
    data_list = profile_details.find_elements(:tag_name, "dl")
    dt_elements = data_list[0].find_elements(:tag_name, "dt")
    dd_elements = data_list[0].find_elements(:tag_name, "dd")

    dt_elements.each_with_index do |dt, index|
      print "#{dt.text} : #{dd_elements[index].text}\n"
    end
  end

  def run_all_edit_profile
    goto_edit_profile
    edit_profile_contact_number
    edit_profile_size_wear
    edit_profile_height
    edit_profile_shoe_size
    edit_profile_have_children
    edit_profile_current_occupation
    edit_profile_checkbox
    complete_profile
  end
end

# e = Edit_Profile.new
# e.login
# e.run_all_edit_profile
# e.display_profile_after_changes
# e.quit
