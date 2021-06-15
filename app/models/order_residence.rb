class OrderResidence
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :state_id, :city, :address_line, :building_name, :phone_number

  validates :state_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }
    validates :city
    validates :address_line
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Residence.create(postal_code: postal_code, state_id: state_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end