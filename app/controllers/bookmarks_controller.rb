class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      flash[:success] = "Bookmark successfully created!"
      redirect_to @bookmark
    else
      flash.now[:error] = "There was an error creating your bookmark."
      render 'new'
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update(bookmark_params)
      flash[:success] = "Bookmark successfully updated!"
      redirect_to @bookmark
    else
      flash.now[:error] = "There was an error updating your bookmark."
      render 'edit'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    flash[:success] = "Bookmark successfully deleted!"
    redirect_to bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :link, :description)
  end
end
