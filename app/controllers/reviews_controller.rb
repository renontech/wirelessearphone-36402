class ReviewsController < ApplicationController
  before_action :item_find
  before_action :authenticate_user!
  before_action :review_find, only: [:edit, :update, :destroy]
  before_action :access_block, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to item_path(@item.id, anchor: 'review-group'), notice: 'レビューを投稿しました。'
    else
      flash.now[:alert] = 'レビューを投稿できませんでした。'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to item_path(@item.id, anchor: 'reviews'), notice: 'レビューを更新しました。'
    else
      flash.now[:alert] = 'レビューを更新できませんでした。'
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to item_path(@item.id, anchor: 'review-group'), notice: 'レビューを削除しました。'
    else
      flash.now[:alert] = 'レビューを削除できませんでした。'
      render 'items#show'
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

  def access_block
    if @review.user_id != current_user.id
      redirect_to root_path
    end
  end

end
