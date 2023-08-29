require "test/unit"

require_relative "Selenium_Wrapper"

class TestAverage < Test::Unit::TestCase
  @@url = "/app/test/index.html"
  # @@url = "http://127.0.0.1:5500/test/index.html"

  def test_open_website
    test_creation_selenium = SeleniumWrapper.new
    assert_equal(nil, test_creation_selenium.open_website(@@url))
    test_creation_selenium.quit
  end
end
