class ReviewsController < ApplicationController
before_action :item_find
before_action :authenticate_user!

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

  private

  def review_params
    params.require(:review).permit(:title, :text, :point).merge(user_id: current_user.id, item_id: @item.id)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
