require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item) 
      @order_residence = FactoryBot.build(:order_residence, user_id: user, item_id: item)
    end

    describe '商品購入機能' do
      context'購入できる場合' do
        it '正しく入力し、手続きされれば購入できる' do
          expect(@order_residence).to be_valid
        end

        it 'building_nameが空でも購入できる' do
          building_name = ''
          expect(@order_residence).to be_valid
        end

        it 'phone_numberは10文字でも購入できる' do
          @order_residence.phone_number = '1234567890'
          expect(@order_residence).to be_valid
        end
      end

      context '購入できない場合' do
        it 'tokenが空では購入できない' do
          @order_residence.token  = ''
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Token can't be blank")
        end

        it 'state_idが空では購入できない' do
          @order_residence.state_id  = ''
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("State is not a number")
        end

        it 'state_idが1では購入できない' do
          @order_residence.state_id  = 1
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("State must be other than 1")
        end

        it 'cityが空では購入できない' do
          @order_residence.city = ''
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("City can't be blank")
        end

        it 'address_lineが空では購入できない' do
          @order_residence.address_line = ''
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Address line can't be blank")
        end

        it 'postal_codeが空では購入できない' do
          @order_residence.postal_code = ''
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeはハイフンが無ければ購入できない' do
          @order_residence.postal_code = '1234567'
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Postal code is invalid")
        end

        it 'postal_codeが全角では購入できない' do
          @order_residence.postal_code = '１２３４５６７'
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Postal code is invalid")
        end

        it 'phone_numberが空では購入できない' do
          @order_residence.phone_number = ''
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'phone_numberが12文字以上では購入できない' do
          @order_residence.phone_number = '123456789012'
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが全角では購入できない' do
          @order_residence.phone_number = '１２３４５６７８９０１'
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Phone number is invalid")
        end

        it 'phone_numberが英数字混合では登録できない' do
          @order_residence.phone_number = '123456aaaaa'
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Phone number is invalid")
        end

        it 'user_idが空では登録できないこと' do
          @order_residence.user_id = ''
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空では登録できないこと' do
          @order_residence.item_id = ''
          @order_residence.valid?
          expect(@order_residence.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
