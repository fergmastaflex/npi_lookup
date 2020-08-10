class CreateTaxonomies < ActiveRecord::Migration[6.0]
  def change
    create_table :taxonomies do |t|
      t.string :code
      t.string :desc
      t.boolean :primary
      t.string :state
      t.string :license
      t.references :provider, foreign_key: true
      t.timestamps
    end
  end
end
