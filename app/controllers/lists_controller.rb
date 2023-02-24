class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end


  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks

  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path()
end

  private

  def list_params
    params.require(:list).permit(:name, :title, :body, :photo )
  end
end
