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
    bookmark = Bookmark.new(title: "Netflix", description: "video streaming")
    refute bookmark.save, "Saved the bookmark without a link"
  end

  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post :create, bookmark: { link: "https://www.google.com" }
    end
    assert_redirected_to bookmark_path(assigns(:bookmark))
    assert_equal "Bookmark successfully created!", flash[:success]
  end

  test "should update bookmark" do
    patch :update, id: @bookmark, bookmark: { link: "www.grooveshark.com" }
    assert_redirected_to bookmark_path(assigns(:bookmark))
  end

  test "should destroy bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete :destroy, id: @bookmark.id
    end
    assert_redirected_to bookmarks_path
  end

end
