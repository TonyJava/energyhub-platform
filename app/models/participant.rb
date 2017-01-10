class Participant < ApplicationRecord
  belongs_to :hub
  has_many :sites, dependent: :nullify
  accepts_nested_attributes_for :sites

  validates :first_name, :last_name, presence: true

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
