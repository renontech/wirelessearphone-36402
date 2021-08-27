require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'レビュー投稿機能' do
    before do
      @review = FactoryBot.build(:review)
    end
    context '投稿できる場合' do
      it '全ての項目を適切に入力すれば投稿できる' do
        expect(@review).to be_valid
      end
      it 'pointが0~10までの半角数値なら投稿できる' do
        @review.point = 0
        expect(@review).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'titleが空だと投稿出来ない' do
        @review.title = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空だと投稿出来ない' do
        @review.text = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Text can't be blank")
      end
      it 'pointが空だと投稿出来ない' do
        @review.point = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Point can't be blank")
      end
      it 'pointが半角数値でなければ投稿出来ない' do
        @review.point = '１０'
        @review.valid?
        expect(@review.errors.full_messages).to include("Point is not a number")
      end
      it 'pointに小数点が含まれていると投稿出来ない' do
        @review.point = 5.5
        @review.valid?
        expect(@review.errors.full_messages).to include("Point must be an integer")
      end
      it 'pointが1未満の半角数値だと投稿できない' do
        @review.point = -1
        @review.valid?
        expect(@review.errors.full_messages).to include("Point must be greater than or equal to 0")
      end
      it 'pointが10を超える半角数値だと投稿できない' do
        @review.point = 11
        @review.valid?
        expect(@review.errors.full_messages).to include("Point must be less than or equal to 10")
      end
      it 'userが紐づいていなければ投稿出来ない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("User must exist")
      end
    end
  end
end
