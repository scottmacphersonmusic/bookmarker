class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    @bookmark.save
    redirect_to @bookmark
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :link, :description)
  end
end
