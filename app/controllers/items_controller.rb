class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    # @review = Review.find(1)
    @reviews = Review.order('created_at DESC')
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :maker, :sound, :anc, :ambient, :type, :size, :codec, :image)
  end
end
