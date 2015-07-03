require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  test "should not save without a link" do
    bookmark = Bookmark.new
    refute bookmark.save, "Saved the bookmark without a link"
  end
end
