class Hub < ApplicationRecord
  has_many :participants
  has_many :projects

  validates :name, presence: true

  def sites
    sites = []
    self.participants.each do |participant|
      participant.sites.each do |site|
        sites << site
      end
    end
    return sites
  end

  def projects
    projects = []
    self.sites.each do |site|
      site.projects.each do |project|
        projects << project
      end
    end
    return projects
  end
end
