require 'rails_helper'

RSpec.describe Proposal, type: :model do
  let(:hub) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:site) { create(:site, participant_id: participant.id) }
  let(:contractor) { create(:contractor) }
  let(:project) { site.projects.create(FactoryGirl.build(:project).attributes) }

  describe "Associations" do
    specify { should belong_to :project }
    specify { should belong_to :contractor }
  end

  describe "Callbacks" do
    before(:each) do
      contractor
      project
    end

    context "after_create #create_proposal_steps" do
      it "triggers create_proposal_steps" do
        proposal = project.proposals.build(contractor_id: contractor.id)
        expect(proposal).to receive(:create_proposal_steps)
        proposal.save
      end

      it "creates the proposal_steps with the correct attributes" do
        proposal = project.proposals.create(contractor_id: contractor.id)
        expect(proposal.proposal_steps.count).to eq(6)
        expect(proposal.proposal_steps.order(:order).first.name).to eq(ProposalStep::INITIATED)
      end
    end
  end
end
