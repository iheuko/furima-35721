require 'rails_helper'

RSpec.describe Residence, type: :model do
  describe '#create' do
    before do
      @residence = FactoryBot.build(:residence)
    end

    describe '商品購入機能' do
      context'購入できる場合' do
        it '正しく入力し、手続きされれば購入できる' do
          expect(@residence).to be_valid
        end

        it 'building_nameが空でも購入できる' do
          building_name =''
          expect(@residence).to be_valid
        end

        it 'phone_numberは10文字でも購入できる' do
          @residence.phone_number = '1234567890'
          expect(@residence).to be_valid
        end
      end

      context '購入できない場合' do
        it 'orderのidが無ければ購入できない' do
          @residence.order = nil
          @residence.valid?
          expect(@residence.errors.full_messages).to include('Order must exist')
        end

        it 'state_idが空では購入できない' do
          @residence.state_id  = ''
          @residence.valid?
          expect(@residence.errors.full_messages).to include('State id is blank')
        end

        it 'cityが空では購入できない' do
          @residence.city = ''
          @residence.valid?
          expect(@residence.errors.full_messages).to include('City is blank')
        end

        it 'address_lineが空では購入できない' do
          @residence.address_line = ''
          @residence.valid?
          expect(@residence.errors.full_messages).to include('Address line is blank')
        end

        it 'postal_codeが空では購入できない' do
          @residence.postal_code = ''
          @residence.valid?
          expect(@residence.errors.full_messages).to include('Postal code is blank')
        end

        it 'postal_codeはハイフンが無ければ購入できない' do
          @residence.postal_code = '1234567'
          @residence.valid?
          expect(@residence.errors.full_messages).to include('Postal code is blank')
        end

        it 'postal_codeが全角では購入できない' do
          @residence.postal_code = '１２３４５６７'
          @residence.valid?
          expect(@residence.errors.full_messages).to include('Postal code is blank')
        end

        it 'phone_numberが空では購入できない' do
          @residence.phone_number = ''
          @residence.valid?
          expect(@residence.errors.full_messages).to include('phone_number code is blank')
        end

        it 'phone_numberは12文字以上では購入できない' do
          @residence.phone_number = '123456789012'
          @residence.valid?
          expect(@residence.errors.full_messages).to include('Postal code is blank')
        end

        it 'phone_numberは全角では購入できない' do
          @residence.phone_number = '１２３４５６７８９０１'
          @residence.valid?
          expect(@residence.errors.full_messages).to include('Postal code is blank')
        end
      end
    end
  end
end
