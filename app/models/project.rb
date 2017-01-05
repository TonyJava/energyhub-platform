class Project < ApplicationRecord
  has_many :site_projects
  has_many :sites, through: :site_projects
  has_many :proposals
  has_many :contractors, through: :proposals

  validates :project_type, presence: true

  def hub
    if self.sites.any? && self.sites.first.participant && self.sites.first.participant.hub
      self.sites.first.participant.hub
    else
      nil
    end
  end
end
