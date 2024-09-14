require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it '全ての入力が存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it '商品画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image を添付してください')
      end
      it '商品名が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '商品のカテゴリーが「---」では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が「---」では保存できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '配送料の負担が「---」では保存できない' do
        @item.load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end
      it '配送元の地域が「---」では保存できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '配送までの日数が「---」では保存できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '価格が空では保存できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it '価格が300より小さいと保存できない' do
        @item.selling_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end
      it '価格が9999999より大きいと保存できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end
      it '価格が半角数字以外だと保存できない' do
        @item.selling_price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
