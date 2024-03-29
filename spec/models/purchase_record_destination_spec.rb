require 'rails_helper'

RSpec.describe PurchaseRecordDestination, type: :model do
  before do
    
    @purchase_record_destination = FactoryBot.build(:purchase_record_destination)
  end

  describe '商品の購入' do
    
    context '商品の購入ができるとき' do
      
      it '条件を満たした上ですべての入力があれば、購入できる' do
        expect(@purchase_record_destination).to be_valid
      end

      it '建物名が空でも、他項目の条件を満たした上ですべての入力があれば、購入できる' do
        @purchase_record_destination.building = ""
        expect(@purchase_record_destination).to be_valid
      end

    end

    context '商品の購入ができないとき' do
      
      it 'クレジットカード情報が空の場合、購入できない' do
        @purchase_record_destination.token = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空の場合、購入できない' do
        @purchase_record_destination.postal_code = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列以外の場合、購入できない' do
        @purchase_record_destination.postal_code = "1234567"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '都道府県が空の場合、購入できない' do
        @purchase_record_destination.region_id = 1
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Region can't be blank")
      end

      it '市区町村が空の場合、購入できない' do
        @purchase_record_destination.city = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空の場合、購入できない' do
        @purchase_record_destination.block = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空の場合、購入できない' do
        @purchase_record_destination.phone_number = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下の場合、購入できない' do
        @purchase_record_destination.phone_number = "080456789"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number is too short")
      end

      it '電話番号にハイフンが含まれていた場合、購入できない' do
        @purchase_record_destination.phone_number = "080-1234-5678"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '購入者が紐づいていない場合、購入できない' do
        @purchase_record_destination.user_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("User can't be blank")
      end

      it '商品が紐づいていない場合、購入できない' do
        @purchase_record_destination.item_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Item can't be blank")
      end



    end




  end



end
