class Admins::GenresController < ApplicationController
  def create
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def show
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end
