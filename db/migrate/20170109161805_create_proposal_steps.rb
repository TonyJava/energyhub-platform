class CreateProposalSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :proposal_steps, id: :uuid do |t|
      t.string :name
      t.date :step_completed
      t.integer :order

      t.timestamps
    end
    add_column :proposal_steps, :proposal_id, :uuid
    add_index :proposal_steps, :proposal_id
  end
end
