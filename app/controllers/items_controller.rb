class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC').includes(:reviews)
    # @reviews = Item.order('created_at DESC')
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

  private

  def item_params
    params.require(:item).permit(:name, :price, :maker, :driver, :anc, :ambient, :bluetooth, :weight, :codec, :date, :image)
  end
end
