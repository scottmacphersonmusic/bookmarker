require 'test_helper'

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "should escape html correctly" do
    visit('/bookmarks/new')
    fill_in('Title', with: "Yamaha Saxophones")
    fill_in('Link', with: "http://usa.yamaha.com/products/musical-instruments/winds/sax/")
    fill_in('Description', with: "usa homepage for yamaha saxophones &`<'>\",!@$()[]{}=+")
    click_button 'Submit'
    bookmark = Bookmark.find_by_id("980190963")
    assert_equal "Yamaha&nbsp;Saxophones", bookmark.title
    assert_equal "http://usa.yamaha.com/products/musical-instruments/winds/sax/", bookmark.link
    assert_equal "usa&nbsp;homepage&nbsp;for&nbsp;yamaha&nbsp;saxophones&nbsp;&amp;`&lt;'&gt;\&quot;,!@$()[]{}=+",
                 bookmark.description
  end
end
