class ChangeColumnItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null :items, :item_name, false
    
    change_column_null :items, :message, false
    
    change_column_null :items, :price, false
    
    change_column_null :items, :category_id, false

    change_column_null :items, :item_status_id, false
    
    change_column_null :items, :burden_id, false
    
    change_column_null :items, :state_id, false

    change_column_null :items, :shipping_day_id, false
    
  end
end
