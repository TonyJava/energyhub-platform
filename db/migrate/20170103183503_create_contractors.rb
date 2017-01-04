class CreateContractors < ActiveRecord::Migration[5.0]
  def change
    create_table :contractors, id: :uuid do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :phone
      t.string :states_serviced, array: true

      t.timestamps
    end
  end
end
