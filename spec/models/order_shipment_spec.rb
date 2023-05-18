require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  describe '購入機能' do

    before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)  
    @order_shipment = FactoryBot.build(:order_shipment, item_id: item.id, user_id: user.id)
     
    end
  
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
         expect(@order_shipment).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shipment.building = ''
        expect(@order_shipment).to be_valid
      end
      
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_shipment.postal_code = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postal code can't be blank")
      end
      
  it 'postal_codeが「3桁ハイフン4桁」の半角文字列以外だと保存できないこと' do
    @order_shipment.postal_code = '1234567' # 不正な郵便番号
    expect(@order_shipment).not_to be_valid
    expect(@order_shipment.errors.full_messages).to include("Postal code is invalid")
  end

  it 'prefecture「---」が選択されている場合は保存できないこと' do
    @order_shipment.prefecture_id = 1 
    @order_shipment.valid?
    expect(@order_shipment.errors.full_messages).to include('Prefecture must be other than 1')
  end
  
  it 'cityが空だと保存できないこと' do
    @order_shipment.city = ''
    @order_shipment.valid?
    expect(@order_shipment.errors.full_messages).to include("City can't be blank")
  end
  
  it 'addressesが空だと保存できないこと' do
    @order_shipment.addresses = ''
    @order_shipment.valid?
    expect(@order_shipment.errors.full_messages).to include("Addresses can't be blank")
  end
  
  it 'phone_numberが空だと保存できないこと' do
    @order_shipment.phone_number = ''
    @order_shipment.valid?
    expect(@order_shipment.errors.full_messages).to include("Phone number can't be blank")
  end
  
  it 'phone_numberが電話番号は、10桁以上11桁以内の半角数値以外だと保存できないこと' do
    @order_shipment.phone_number = '123456789012' 
    @order_shipment.valid?
    expect(@order_shipment.errors.full_messages).to include("Phone number is invalid")
  end
  
  
  it 'itemが紐付いていないと保存できないこと' do
    @order_shipment.item_id = nil
    @order_shipment.valid?
    expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
  end
  
  it 'userが紐付いていなければ保存できないこと' do
    @order_shipment.user_id = nil
    @order_shipment.valid?
    expect(@order_shipment.errors.full_messages).to include("User can't be blank")
  end
    end
  end
end

