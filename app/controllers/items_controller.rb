class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @reviews = @item.reviews.order('updated_at DESC').includes(:user)
    @review = Review.new
  end

  def search
    @items = Item.search(params[:keyword]).order('created_at DESC')
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

  private

  def item_params
    params.require(:item).permit(:name, :price, :maker, :driver, :anc, :ambient, :bluetooth, :weight, :codec, :date, :image)
  end

end
