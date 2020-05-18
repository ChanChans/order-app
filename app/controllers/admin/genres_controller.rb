class Admin::GenresController < ApplicationController



  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
  end

  def edit
    @genre.find(params[:id])
  end

  def update
    @genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_valid)
  end

end
