class OrderResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :city, :address_line, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
    validates :address_line, format: { with: /\A[ぁ-んァ-ン一-龥々ー][\d][-]+\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  validates :state_id, numericality: { other_than: 1 }
  validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー][\d][a-z]+\z/i } 


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, state_id: state_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end