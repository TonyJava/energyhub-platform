class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites, id: :uuid do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :property_type
      t.timestamps
    end
    add_column :sites, :participant_id, :uuid
    add_index :sites, :participant_id
  end
end
