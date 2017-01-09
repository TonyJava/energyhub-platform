class Proposal < ApplicationRecord
  belongs_to :contractor
  belongs_to :project
  has_many :proposal_steps
  accepts_nested_attributes_for :proposal_steps

  after_create :create_proposal_steps

  private

  def create_proposal_steps
    binding.pry
    self.proposal_steps.create(name: ProposalStep::INITIATED, order: 1)
    self.proposal_steps.create(name: ProposalStep::SCHEDULED, order: 2)
    self.proposal_steps.create(name: ProposalStep::ONSITE_COMPLETED, order: 3)
    self.proposal_steps.create(name: ProposalStep::PROPOSAL_PRESENTED, order: 4)
    self.proposal_steps.create(name: ProposalStep::CLOSED_NOT_SELECTED, order: 5)
    self.proposal_steps.create(name: ProposalStep::SELECTED, order: 6)
  end
end
