class AddNotesToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :notes, :text
  end
end
