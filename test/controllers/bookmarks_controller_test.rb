require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmarks)
  end

  test "index should render correct template and layout" do
    get :index
    assert_template :index
    assert_template layout: "layouts/application"
    assert_select "title", "Bookmarker"
  end

  test "should not save without a link" do
    bookmark = Bookmark.new
    refute bookmark.save, "Saved the bookmark without a link"
  end
end
