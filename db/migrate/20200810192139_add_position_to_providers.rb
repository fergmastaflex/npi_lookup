class AddPositionToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :position, :integer
  end
end
