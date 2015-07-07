require 'test_helper'

def assert_no_console_logs
  assert_equal 0, page.driver.console_messages.size
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  Capybara.default_driver = :webkit

  test "should escape html correctly" do
    visit('/bookmarks/new')
    fill_in('Title', with: "Yamaha Saxophones Bookmark Title<script>console.log('uh oh');</script>")
    fill_in('Link', with: "http://usa.yamaha.com/products/musical-instruments/winds/sax/")
    fill_in('Description', with: "usa homepage for yamaha saxophones &`<'>\",!@$()[]{}=+")
    click_button 'Submit'

    assert page.has_content? "Yamaha Saxophones Bookmark Title"
    assert_no_console_logs
  end
end
