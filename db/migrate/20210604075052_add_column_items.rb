class AddColumnItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_name,       :string
    add_column :items, :message,         :text 
    add_column :items, :price,           :integer
    add_column :items, :category_id,     :integer
    add_column :items, :item_status_id,  :integer
    add_column :items, :burden_id,       :integer
    add_column :items, :state_id,        :integer
    add_column :items, :shipping_day_id, :integer
    add_column :items, :user,            :reference
  end
end
