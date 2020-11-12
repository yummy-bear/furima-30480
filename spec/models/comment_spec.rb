require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメントの投稿がうまくいくとき' do

      it '全ての項目の入力が存在すれば登録できること' do
        expect(@comment).to be_valid
      end

    end

    context 'コメントの投稿がうまくいかないとき' do

      it 'テキストがないと、登録できないこと' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Item must exist')
      end

    end

  end
end
