class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :country_code
      t.string :country_name
      t.string :address_purpose
      t.string :address_type
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :telephone_number
      t.references :provider, foreign_key: true
      t.timestamps
    end
  end
end
