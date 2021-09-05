class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.includes(:item)
    @favorites = @user.favorites.includes(:item)
  end
end
