require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase

  def setup
    @bookmark = bookmarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmarks)
  end

  test "index should render correct template and layout" do
    get :index
    assert_template :index
    assert_template layout: "layouts/application", partial: '_navbar'
    assert_select "title", "Bookmarker"
  end

  test "should show bookmark" do
    get :show, id: @bookmark
    assert_response :success
    assert_not_nil assigns(:bookmark)
  end

  test "show should render correct template and layout" do
    get :show, id: @bookmark
    assert_template :show
    assert_template layout: "layouts/application"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "new should render correct template and layout" do
    get :new
    assert_template :new
    assert_template layout: 'layouts/application', partial: '_form'
  end

  test "should get edit" do
    get :edit, id: @bookmark
    assert_response :success
    assert_not_nil assigns(:bookmark)
  end

  test "edit should render correct template and layout" do
    get :edit, id: @bookmark
    assert_template :edit
    assert_template layout: 'layouts/application', partial: '_form'
  end

  test "should not save without a link" do
    bookmark = Bookmark.new
    refute bookmark.save, "Saved the bookmark without a link"
  end
end
