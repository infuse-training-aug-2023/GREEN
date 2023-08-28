require "test/unit"

require_relative "Selenium_Wrapper"

class TestAverage < Test::Unit::TestCase
  $url = 'http://127.0.0.1:5500/test/index.html'

  def test_selenium_wrapper_object
    test_creation_selenium_wrapper = SeleniumWrapper.new
    assert test_creation_selenium_wrapper.instance_of? SeleniumWrapper
  end

  def test_open_website
    test_creation_selenium = SeleniumWrapper.new
    # test_open_website = test_creation_selenium.open_website('http://127.0.0.1:5500/GREEN/test/index.html')
    assert_equal(nil, test_creation_selenium.open_website($url))
  end

  def test_set_wait
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website($url)
    assert_not_nil(test_creation_selenium.set_wait(10))
  end

  def test_send_keys
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website($url)
    test_creation_selenium.set_wait(10)
    assert_equal(1, test_creation_selenium.send_keys(:id, "username", "usr"))
  end

  def test_select_options
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website($url)
    test_creation_selenium.set_wait(10)
    assert_equal(1, test_creation_selenium.select_options(:name, "role", :value, "admin"))
  end

  def test_click
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website($url)
    test_creation_selenium.set_wait(10)
    test_creation_selenium.send_keys(:id, "username", "usr")
    test_creation_selenium.send_keys(:id, "password", "pass")
    test_creation_selenium.select_options(:name, "role", :value, "admin")
    assert_equal(1, test_creation_selenium.click(:tag_name, "button"))
  end

  def test_get_element
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website($url)
    test_creation_selenium.set_wait(10)
    test_creation_selenium.send_keys(:id, "username", "usr")
    test_creation_selenium.send_keys(:id, "password", "pass")
    test_creation_selenium.select_options(:name, "role", :value, "admin")
    test_creation_selenium.click(:tag_name, "button")
    assert_not_nil(test_creation_selenium.get_element(:id, "displayUsername"))
  end

  def test_quit
    test_creation_selenium = SeleniumWrapper.new
    test_creation_selenium.open_website($url)
    assert_equal(nil, test_creation_selenium.quit())
  end
end
