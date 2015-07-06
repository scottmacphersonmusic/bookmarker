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

  test "should route to index" do
    assert_routing bookmarks_path, { controller: "bookmarks", action: "index" }
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

  test "should route to show" do
    assert_routing "bookmarks/1", { controller: "bookmarks", action: "show", id: "1"}
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:bookmark)
  end

  test "new should render correct template and layout" do
    get :new
    assert_template :new
    assert_template layout: 'layouts/application', partial: '_form'
  end

  test "should route to new" do
    assert_routing "bookmarks/new", { controller: "bookmarks", action: "new" }
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

  test "should route to edit" do
    assert_routing "bookmarks/1/edit", { controller: "bookmarks", action: "edit", id: "1"  }
  end

  test "should not save without a link" do
    bookmark = Bookmark.new
    refute bookmark.save, "Saved the bookmark without a link"
  end

  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post :create, bookmark: { link: "https://www.google.com" }
    end
    assert_redirected_to bookmark_path(assigns(:bookmark))
    assert_equal "Bookmark successfully created!", flash[:success]
  end

  test "should route to create bookmark" do
    assert_routing({ method: "post", path: "/bookmarks" },
                   { controller: "bookmarks", action: "create" })
  end

  test "should update bookmark" do
    patch :update, id: @bookmark, bookmark: { link: "www.grooveshark.com" }
    assert_redirected_to bookmark_path(assigns(:bookmark))
    assert_equal "Bookmark successfully updated!", flash[:success]
  end

  test "should route to update bookmark" do
    assert_routing({ method: "patch", path: "/bookmarks/1" },
                   { controller: "bookmarks", action: "update", id: "1" })
  end

  test "should destroy bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete :destroy, id: @bookmark.id
    end
    assert_redirected_to bookmarks_path
    assert_equal "Bookmark successfully deleted!", flash[:success]
  end

  test "should route to destroy bookmark" do
    assert_routing({ method: "delete", path: "/bookmarks/1" },
                   { controller: "bookmarks", action: "destroy", id: "1" })
  end
end
