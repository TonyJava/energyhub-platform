class Hub < ApplicationRecord
  validates :name, presence: true

  has_many :participants
end
