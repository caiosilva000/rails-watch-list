class BookmarksController < ApplicationController
  def new
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new
  end

  def create
      @list = List.find(params[:list_id]) # Found the bookmark list
      @bookmark = Bookmark.new(bookmark_params) # instantiate a new bookmark with content
      @movie = Movie.find(params[:bookmark][:movie_id]) #find movie from params
      @bookmark.list = @list # assign list to bookmark
      @bookmark.movie = @movie # assign movie to bookmark
      if @bookmark.save!
          redirect_to list_path(@list)
      end
  end

  def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
  end


  private
  def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
  end
end
