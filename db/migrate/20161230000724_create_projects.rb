class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.uuid :hub_id
      t.uuid :site_id
      t.string :project_status
      t.string :intake_path
      t.string :project_type
      t.decimal :estimated_annual_production
      t.decimal :estimated_annual_savings
      t.decimal :total_project_cost, precision: 12, scale: 2
      t.date :fee_invoice_sent
      t.date :fee_received
      t.text :notes

      t.timestamps
    end
  end
end
