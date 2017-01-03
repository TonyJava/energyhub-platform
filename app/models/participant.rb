class Participant < ApplicationRecord
  belongs_to :hub
  has_many :sites

  def projects
    projects = []
    self.sites.each do |site|
      site.projects.each do |project|
        projects << project
      end
    end
    return projects
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
