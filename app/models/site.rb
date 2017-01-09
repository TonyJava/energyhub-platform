class Site < ApplicationRecord
  BUSINESS = "Business"
  RESIDENTIAL = "Residential"
  MUNICIPALITY = "Municipality / City"
  NON_PROFIT = "Non-Profit / Church"
  OTHER = "Other"

  has_many :site_projects
  has_many :projects, through: :site_projects, dependent: :nullify
  belongs_to :participant

  validates :city, :state, :name, :property_type, presence: true

  def address
    "#{self.address_1} #{self.address_2}"
  end
end
