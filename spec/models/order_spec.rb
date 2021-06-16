require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order)
    end
    it 'userのidが無ければ保存されない' do
      @order.user = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('User must exist')
    end

    it 'itemのidが無ければ保存されない' do
      @order.item = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('Item must exist')
    end
  end
end
