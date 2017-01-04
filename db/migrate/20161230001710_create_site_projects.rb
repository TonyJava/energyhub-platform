class CreateSiteProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :site_projects, id: :uuid do |t|
      t.timestamps
    end

    add_column :site_projects, :site_id, :uuid
    add_index :site_projects, :site_id
    add_column :site_projects, :project_id, :uuid
    add_index :site_projects, :project_id
  end
end
