class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :burden
  belongs_to :state
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates_inclusion_of :price, in:300..9999999, presence: true, format: { with: /\A(?=.*?\d)+\z/ } 

  with_options presence: true do
    validates :item_name
    validates :message
    validates :price
  end

  with_options numericality: { other_than: 1 },  presence: true do
    validates :category_id
    validates :item_status_id
    validates :burden_id
    validates :state_id 
    validates :shipping_day_id
  end
end
