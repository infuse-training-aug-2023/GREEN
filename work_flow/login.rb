require_relative "../selenium_wrapper"

class LoginFlow
  attr_accessor :driver

  def initialize
    @driver = SeleniumWrapper.new
  end

  def get_driver
    return @driver
  end

  def login
    puts "\nLogging in to Love Bonito"
    @driver.open_website "https://www.lovebonito.com/intl"
    @driver.click(:class, "my-account")
    @driver.send_keys(:id, "email", "gajav64509@trazeco.com")
    @driver.click(:xpath, "/html/body/div[1]/div/div[2]/div[1]/div/div[2]/div[3]/div/div[2]/aside/div[2]/div/div/div[2]/form/div/div[2]/button/span")
    @driver.send_keys(:name, "password", "gajav64509@trazeco.com@16")
    @driver.click(:xpath, '//*[@id="viewport"]/div[1]/div/div[2]/div[3]/div/div[2]/aside/div[2]/div/div/div[2]/form/div/div[3]/button')
    puts "Waiting for Authorization"
    loop do
      authorization_modal = @driver.get_element(:class, "m-loader")
      if not authorization_modal.displayed?
        break
      end
    end
    puts "Authorization Complete"
  end

  def quit
    @driver.quit
  end
end

# c = LoginFlow.new
# c.login
# sleep 50
# c.quit
