class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :tel, null: false
      t.string :postal_code, null: false
      t.references :item, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
