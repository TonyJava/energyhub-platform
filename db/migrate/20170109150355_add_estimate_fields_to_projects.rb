class AddEstimateFieldsToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :solar_estimate, :decimal
    add_column :projects, :ee_estimate, :decimal, precision: 12, scale: 2
  end
end
