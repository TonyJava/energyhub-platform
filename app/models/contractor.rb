class Contractor < ApplicationRecord
  has_many :proposals
  has_many :projects, through: :proposals

  validates :name, presence: true
end
