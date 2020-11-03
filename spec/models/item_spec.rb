require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品登録' do
      context '登録できること' do
        it 'name,image,price,about,genre_id,condition_id,delivery_fee_id,prefecture_id,days_idの値が存在すれば登録できること' do
          expect(@item).to be_valid
        end
        it 'priceが300〜9999999なら登録できること' do
          @item.price = 300
          expect(@item).to be_valid
        end
      end

      context '登録できないこと' do
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では登録できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'aboutが空では登録できないこと' do
          @item.about = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("About can't be blank")
        end

        it 'categoryが空では登録できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Category is not a number', "Category can't be blank")
        end

        it 'status_idが空では登録できないこと' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Status is not a number', "Status can't be blank")
        end

        it 'delivery_fee_idが空では登録できないこと' do
          @item.delivery_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee is not a number', "Delivery fee can't be blank")
        end
        it 'prefecture_idが空では登録できないこと' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'days_idが空では登録できないこと' do
          @item.days_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Days is not a number', "Days can't be blank")
        end

        it 'priceが299だと登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it 'priceが10000000だと登録できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end

        it 'category_idが1だと登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'status_idが1だと登録できないこと' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end
        it 'delivery_fee_idが1だと登録できないこと' do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
        end
        it 'prefecture_idが1だと登録できないこと' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
        end
        it 'days_idが1だと登録できないこと' do
          @item.days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Days must be other than 1')
        end
      end
    end
  end
end
