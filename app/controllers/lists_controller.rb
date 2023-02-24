class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def show
    @lists = List.all
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.movie = @movie
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path()
end

  private

  def list_params
    params.require(:list).permit(:name, :title, :body, :photo, :movie_id)
  end
end
