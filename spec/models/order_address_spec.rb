require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入情報登録がうまくいくとき' do
      it '情報がすべて入力されていれば保存される' do
        expect(@order_address).to be_valid
      end
    end

    context '購入情報登録がうまくいかないとき' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end

      it '郵便番号にハイフンがないと保存できないこと' do
        @order_address.zip_code = '0010006'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid')
      end

      it '都道府県が空保存できないこと' do
        @order_address.delivery_area_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '市町村が空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_address.address_line = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内であること' do
        @order_address.phone_number = '090111122223'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
