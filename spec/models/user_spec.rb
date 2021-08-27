require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '登録できるとき' do
      it '全ての項目を適切に入力すると登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが12文字以下なら登録できる' do
        @user.nickname = '123456789012'
        expect(@user).to be_valid
      end
      it 'passwordが英数混合6文字以上なら登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end
    context '登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nicknameが12文字を超えると登録できない' do
        @user.nickname = '1234567890123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 12 characters)")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'john-mail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailは重複して登録できない' do
        user1 = FactoryBot.create(:user)
        @user.email = user1.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数混合でも6文字未満だと登録できない' do
        @user.password = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字だけだと6文字以上でも登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英字だけだと6文字以上でも登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password_confirmationがpasswordと一致しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
