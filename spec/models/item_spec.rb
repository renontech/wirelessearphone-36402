require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'イヤホン登録機能' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '登録できる時' do
      it '全ての項目を適切に入力すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数値のみであれば登録できる' do
        @item.price = 29999
        expect(@item).to be_valid
      end
      it 'sound, anc, ambient, type, size, codecが空でも登録できる' do
        @item.sound = ''
        @item.anc = ''
        @item.ambient = ''
        @item.type = ''
        @item.size = ''
        @item.codec = ''
        expect(@item).to be_valid
      end
    end
    context '登録できない時' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("製品名を入力してください")
      end
      it 'makerが空だと登録出来ない' do
        @item.maker = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("メーカーを入力してください")
      end
      it 'priceが空だと登録出来ない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが半角数値のみでなければ登録出来ない' do
        @item.price = '２９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'imageが空だと登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end
