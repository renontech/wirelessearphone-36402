class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user
  # before_action :edit_permit, only: [:edit, :update]

  def show
    @reviews = @user.reviews.includes(:item)
    @favorites = @user.favorites.includes(:item)
  end

  def edit
    if current_user != @user
      redirect_to user_path(@user)
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報を更新しました。'
    else
      flash.now[:alert] = 'ユーザー情報を更新できませんでした。'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def edit_permit
    if current_user != @user
      redirect_to user_path(@user)
    end
  end

  def user_params
    params.require(:user).permit(:nickname)
  end

end
