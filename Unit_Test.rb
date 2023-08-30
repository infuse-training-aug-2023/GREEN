require "test/unit"

require_relative "Selenium_Wrapper"

class TestAverage < Test::Unit::TestCase
  # @@url = "file:///home/zeus/Documents/infuse/GREEN/test/index.html"
  @@url = "file:///app/testindex.html" #for docker

  # @@url = "http://127.0.0.1:5500/test/index.html" # for windows

  def test_selenium_wrapper_object
    test_creation_selenium_wrapper = SeleniumWrapper.new
    assert test_creation_selenium_wrapper.instance_of? SeleniumWrapper
  end

  def test_open_website
    test_creation_selenium = SeleniumWrapper.new
    assert_equal(nil, test_creation_selenium.open_website(@@url))
    test_creation_selenium.quit
  end

  # def test_open_website_failed
  #     test_creation_selenium = SeleniumWrapper.new
  #     # test_open_website = test_creation_selenium.open_website('http://127.0.0.1:5500/test/index.html')
  #     # assert_raise(fatal)do
  #     # test_creation_selenium.open_website('http://12.0.0.1:5500/GREEN/test/index.html')
  #     # end
  #     assert_equal('ERR_CONNECTION_TIMED_OUT',test_creation_selenium.open_website('http://12.0.0.1:5500/GREEN/test/index.html'))
  # end

  def test_set_wait
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    assert_not_nil(test_creation_selenium.set_wait(10))
    test_creation_selenium.quit
  end

  def test_set_wait_failed
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    assert_raise(RuntimeError) do
      test_creation_selenium.set_wait("10")
    end
    test_creation_selenium.quit
  end

  def test_send_keys
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    test_creation_selenium.set_wait(10)
    assert_equal(1, test_creation_selenium.send_keys(:id, "username", "usr"))
    test_creation_selenium.quit
  end

  def test_send_keys_failed
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    test_creation_selenium.set_wait(10)
    assert_raise(RuntimeError) do
      test_creation_selenium.send_keys(:id, "usernaame", "usr")
    end
    test_creation_selenium.quit
  end

  def test_select_options
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    test_creation_selenium.set_wait(10)
    assert_equal(1, test_creation_selenium.select_options(:name, "role", :value, "admin"))
    test_creation_selenium.quit
  end

  def test_select_options_failed
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    test_creation_selenium.set_wait(10)
    assert_raise(RuntimeError) do
      test_creation_selenium.select_options(:name, "rolle", :value, "admin")
    end
    test_creation_selenium.quit
  end

  def test_click
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    test_creation_selenium.set_wait(10)
    test_creation_selenium.send_keys(:id, "username", "usr")
    test_creation_selenium.send_keys(:id, "password", "pass")
    test_creation_selenium.select_options(:name, "role", :value, "admin")
    assert_nothing_raised(RuntimeError) do
      test_creation_selenium.click(:tag_name, "button")
    end
    test_creation_selenium.quit
  end

  def test_click_failed
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    test_creation_selenium.set_wait(10)
    test_creation_selenium.send_keys(:id, "username", "usr")
    test_creation_selenium.send_keys(:id, "password", "pass")
    test_creation_selenium.select_options(:name, "role", :value, "admin")
    assert_raise(RuntimeError) do
      test_creation_selenium.click(:tag_name, "buttton")
    end
    test_creation_selenium.quit
  end

  def test_get_element
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    test_creation_selenium.set_wait(10)
    test_creation_selenium.send_keys(:id, "username", "usr")
    test_creation_selenium.send_keys(:id, "password", "pass")
    test_creation_selenium.select_options(:name, "role", :value, "admin")
    test_creation_selenium.click(:tag_name, "button")
    assert_nothing_raised(RuntimeError) do
      test_creation_selenium.get_element(:id, "displayUsername")
    end
    test_creation_selenium.quit
  end

  def test_get_element_failed
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    test_creation_selenium.set_wait(10)
    test_creation_selenium.send_keys(:id, "username", "usr")
    test_creation_selenium.send_keys(:id, "password", "pass")
    test_creation_selenium.select_options(:name, "role", :value, "admin")
    test_creation_selenium.click(:tag_name, "button")
    assert_raise(RuntimeError) do
      test_creation_selenium.get_element(:id, "displayUusername")
    end
    test_creation_selenium.quit
  end

  def test_quit
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website(@@url)
    assert_equal(nil, test_creation_selenium.quit())
  end
end
