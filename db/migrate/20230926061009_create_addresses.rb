class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code, null:false
      t.integer    :prefecture,  null:false
      t.string     :city
      t.string     :address
      t.string     :building
      t.integer    :phone_number
      t.references :order,       null:false, foreign_key: true
      t.timestamps
    end
  end
end
