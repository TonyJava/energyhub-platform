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
      t.uuid :participant_id

      t.timestamps
    end
  end
end
