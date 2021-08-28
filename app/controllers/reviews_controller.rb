class ReviewsController < ApplicationController
  before_action :item_find
  before_action :authenticate_user!
  before_action :review_find, only: [:edit, :update]
  # before_action :redirect_resque

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :text, :point).merge(user_id: current_user.id, item_id: @item.id)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def review_find
    @review = Review.find(params[:id])
  end

  # def redirect_resque
  #   begin
  #     @item = Item.find(params[:item_id])
  #   rescue
  #     render :new
  #   end
  # end

end
