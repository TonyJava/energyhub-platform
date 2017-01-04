class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals, id: :uuid do |t|
      t.boolean :accepted?
      t.string :proposal_doc

      t.timestamps
    end
    add_column :proposals, :contractor_id, :uuid
    add_index :proposals, :contractor_id
    add_column :proposals, :project_id, :uuid
    add_index :proposals, :project_id
  end
end
