class Hub < ApplicationRecord
  has_many :participants
  has_many :projects

  validates :name, presence: true
end
