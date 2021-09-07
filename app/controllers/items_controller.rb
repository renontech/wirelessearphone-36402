class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  # before_action :set_item, only: [:like, :unlike]

  def index
    @items = Item.order('created_at DESC').includes(:reviews)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path, notice: 'イヤホンの追加に成功しました。'
    else
      flash.now[:alert] = 'イヤホンの追加に失敗しました。'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.includes(:user)
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def compare
    @item1 = Item.find(params[:id])
    @items = Item.where.not(id: @item1.id)
  end

  def ajax
    @selected_item = params[:num]
    @second_item = Item.find(params[:num])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # def like
  #   current_user.favorite_items << @item
  #   render 'favorite.js.erb'
  # end

  # def unlike
  #   current_user.favorite_items.destroy(@item)
  #   render 'favorite.js.erb'
  # end

  private

  def item_params
    params.require(:item).permit(:name, :price, :maker, :driver, :anc, :ambient, :bluetooth, :weight, :codec, :date, :image)
  end

  # def set_item
  #   @item = Item.find_by(id: params[:item_id])
  # end

end
