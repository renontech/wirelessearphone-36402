class FavoritesController < ApplicationController
  before_action :set_item

  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: @item.id)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: @item.id).destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def set_item
    @item = Item.find_by(id: params[:item_id])
  end
end
