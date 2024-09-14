require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user:)
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
    
  end
  describe '商品の購入' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipping_address.building_name = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_shipping_address.post_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁を含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping_address.post_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase_shipping_address.region_id = 1
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_shipping_address.municipalities = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_shipping_address.street_address = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_shipping_address.telephone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号は、10桁以下では保存できないこと' do
        @purchase_shipping_address.telephone_number = '090123456'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number is invalid. must be 10 or 11 digits")
      end
      it '電話番号は、12桁以上では保存できないこと' do
        @purchase_shipping_address.telephone_number = '090123456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number is invalid. must be 10 or 11 digits")
      end
      it '電話番号は、半角数値以外では保存できない'do
        @purchase_shipping_address.telephone_number = '０９０１２３４５６７８'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Telephone number is invalid. must be 10 or 11 digits")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
