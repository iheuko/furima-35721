class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.integer :state_id, null: false
      t.string :city, null: false
      t.string :address_line, null: false
      t.string :postal_code, null: false
      t.string :municipality, null: false
      t.string :phone_number, null: false
      t.string :building_name, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
