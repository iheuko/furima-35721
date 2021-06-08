require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '出品できる場合' do
        it '画像を選択することと正しく入力すれば出品できること' do
          expect(@item).to be_valid
        end
      end
      context '出品できない場合' do
        it '商品名がなければ出品できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it '商品説明がなければ出品できない' do
          @item.message = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Message can't be blank")
        end

        it 'カテゴリー情報がなければ出品できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'カテゴリー情報のidが1であれば出品できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it '商品の状態情報がなければ出品できない' do
          @item.item_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status can't be blank")
        end

        it '商品の状態情報のidが1であれば出品できない' do
          @item.item_status_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status must be other than 1")
        end

        it '配送料の負担情報がなければ出品できない' do
          @item.burden_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Burden can't be blank")
        end

        it '配送料の負担情報のidが1であれば出品できない' do
          @item.burden_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Burden must be other than 1")
        end

        it '配送元の地域情報がなければ出品できない' do
          @item.state_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("State can't be blank")
        end

        it '配送元の地域情報のidが1であれば出品できない' do
          @item.state_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("State must be other than 1")
        end

        it '配送までの日数情報がなければ出品できない' do
          @item.shipping_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end

        it '配送までの日数情報のidが1であれば出品できない' do
          @item.shipping_day_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
        end


        it '販売価格情報がなければ出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '販売価格は¥300を下回る場合出品できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '販売価格は¥9999999を上回る場合出品できない' do
          @item.price = '100000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '販売価格は半角数字のみでなければ出品できない' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '販売価格は数字のみでなければ出品できない' do
          @item.price = 'あああ'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
      end  
    end
  end          
end
