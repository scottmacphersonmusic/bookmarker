require 'test_helper'

class PageParserTest < ActionController::TestCase
  test "#title should return title if present" do
    markup = "<title>a valid title</title>"
    PageParser::LinkInfo.any_instance
                        .stubs(:page)
                        .returns(Nokogiri::HTML(markup))
    assert_equal "a valid title", PageParser::LinkInfo.new("doesnt matter").title
  end
end
