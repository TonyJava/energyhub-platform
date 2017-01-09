class Contractor < ApplicationRecord
  has_many :proposals, dependent: :destroy
  has_many :projects, through: :proposals

  validates :name, presence: true
end
