require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: user)
  end
  

  describe '商品出品' do
    
    context '商品の出品ができるとき' do
      
      it '条件を満たした上ですべての入力があれば、出品できる' do
          expect(@item).to be_valid
        end
    end
  
    context '商品の出品ができないとき' do
      
      it '商品画像がない場合、出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空欄の場合、出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄の場合、出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが未選択の場合、出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '配送料の負担が未選択の場合、出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域が空欄の場合、出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '発送までの日数が空欄の場合、出品できない' do
        @item.days_up_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days up to delivery can't be blank")
      end
      it '価格が空欄の場合、出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満の場合、出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が10,000,000以上の場合、出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が全角の場合、出品できない' do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end

  end
end
