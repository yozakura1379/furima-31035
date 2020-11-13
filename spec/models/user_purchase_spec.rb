require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '#create' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    describe '購入記録' do
      context '登録できること' do
        it 'postal_code,prefecture,city,house_number,telの値が存在すれば登録できること' do
          expect(@user_purchase).to be_valid
        end
      end

      context '登録できないこと' do
        it '郵便番号にハイフンがないと登録できない' do
          @user_purchase.postal_code = 1_111_111
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include('Postal code is invalid')
        end
        it '郵便番号が空では登録できない' do
          @user_purchase.postal_code = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
        end
        it '都道府県が空では登録できない' do
          @user_purchase.prefecture = ''
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村が空では登録できない' do
          @user_purchase.city = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include("City can't be blank")
        end
        it '番地が空では登録できない' do
          @user_purchase.house_number = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
        end
        it '電話番号が空では登録できない' do
          @user_purchase.tel = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include("Tel can't be blank", 'Tel is invalid')
        end
        it '電話番号にハイフンがあると登録できない' do
          @user_purchase.tel = 0o00 - 0o000 - 0o000
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include('Tel is invalid')
        end
        it '電話番号が１２桁以上だと登録できない' do
          @user_purchase.tel = 0o00000000000
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include('Tel is invalid')
        end

        it 'tokenが空だと登録できない' do
          @user_purchase.token = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
