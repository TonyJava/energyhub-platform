class ProposalStep < ApplicationRecord
  INITIATED = "Initiated"
  SCHEDULED = "Scheduled"
  ONSITE_COMPLETED = "Onsite Completed"
  PROPOSAL_PRESENTED = "Proposal Presented"
  CLOSED_NOT_SELECTED = "Closed, Not Selected"
  SELECTED = "Selected"

  belongs_to :proposal

  validates :name, presence: true
end
