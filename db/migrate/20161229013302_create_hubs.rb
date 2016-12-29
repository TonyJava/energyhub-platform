class CreateHubs < ActiveRecord::Migration[5.0]
  def change
    create_table :hubs, id: :uuid do |t|
      t.string :name
      t.float :percent_fee

      t.timestamps
    end
  end
end
