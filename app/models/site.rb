class Site < ApplicationRecord
  has_many :site_projects
  has_many :projects, through: :site_projects
  belongs_to :participant

  validates :city, :state, presence: true
end
