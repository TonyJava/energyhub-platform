class Participant < ApplicationRecord
  belongs_to :hub
  has_many :sites
end
