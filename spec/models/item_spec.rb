require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録がうまくいくとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@item).to be_valid
      end

      it '価格が300円〜9999999円以内であれば登録できること' do
        @item.price = '333'
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it '画像の選択がないと、登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it '商品名がないと、登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないと、登録できないこと' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'カテゴリーの選択がないと、登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end

      it '商品の状態の選択がないと、登録できないこと' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end

      it '配送料負担の選択がないと、登録できないこと' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee is not a number')
      end

      it '配送元地域の選択がないと、登録できないこと' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank", 'Delivery area is not a number')
      end

      it '配送予定日数の選択がないと、登録できないこと' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", 'Delivery day is not a number')
      end

      it '価格がないと、登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円以下だと、登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格が9999999円以上だと、登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
