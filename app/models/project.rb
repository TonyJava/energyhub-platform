class Project < ApplicationRecord
  has_many :site_projects
  has_many :sites, through: :site_projects

  validates :project_type, presence: true

  def hub
    self.sites.first.participant.hub
  end
end
