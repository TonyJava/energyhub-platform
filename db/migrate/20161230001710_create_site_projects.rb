class CreateSiteProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :site_projects do |t|
      t.uuid :site_id
      t.uuid :project_id

      t.timestamps
    end
  end
end
