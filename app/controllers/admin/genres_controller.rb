class Admin::GenresController < ApplicationController



  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index and return
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       redirect_to admin_genres_path
    else
       render :edit and return
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end

end
