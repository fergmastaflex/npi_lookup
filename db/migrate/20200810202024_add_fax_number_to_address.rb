class AddFaxNumberToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :fax_number, :string
  end
end
