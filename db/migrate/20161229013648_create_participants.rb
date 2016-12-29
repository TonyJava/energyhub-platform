class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants, id: :uuid do |t|
      t.integer :hub_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :organization
      t.string :title
      t.text :notes

      t.timestamps
    end
  end
end
