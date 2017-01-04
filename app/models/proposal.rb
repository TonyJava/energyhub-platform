class Proposal < ApplicationRecord
  belongs_to :contractor
  belongs_to :project
end
