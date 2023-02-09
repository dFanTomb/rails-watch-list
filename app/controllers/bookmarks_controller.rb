class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
    # @list = List.find(params[:list_id]) => before_action :set_list
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @list = List.find(params[:list_id]) => before_action :set_list
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      rendern :new
    end
  end

  def destroy
    # @bookmark = Bookmark.find(params[:id])  => before_action :set_bookmark
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
