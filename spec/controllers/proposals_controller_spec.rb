require 'rails_helper'

RSpec.describe ProposalsController, type: :controller do
    let(:user) { create(:user) }
  let(:hub) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:site) { create(:site, participant_id: participant.id) }
  let(:project) { site.projects.create(FactoryGirl.build(:project).attributes) }
  let(:contractor) { create(:contractor) }
  let(:proposal) { project.proposals.create(contractor_id: contractor.id) } 
  let(:valid_attributes) {
    FactoryGirl.build(:proposal, project_id: project.id, contractor_id: contractor.id).attributes
  }

  describe "GET #show" do
    before(:each) do
      sign_in user
      proposal
    end

    it "assigns the requested proposal as @proposal" do
      get :show, params: {id: proposal.to_param}
      expect(assigns(:proposal)).to eq(proposal)
    end
  end

  describe "GET #edit" do
    before(:each) do
      sign_in user
      proposal
    end

    it "assigns the requested proposal as @proposal" do
      get :edit, params: {id: proposal.to_param}
      expect(assigns(:proposal)).to eq(proposal)
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
      proposal
    end

    context "with valid params" do
      let(:new_attributes) {
        { accepted?: true }
      }

      it "updates the requested proposal" do
        put :update, params: {id: proposal.to_param, proposal: new_attributes}
        proposal.reload
        expect(proposal.accepted?).to eq(true)
      end

      it "assigns the requested proposal as @proposal" do

        put :update, params: {id: proposal.to_param, proposal: valid_attributes}
        expect(assigns(:proposal)).to eq(proposal)
      end

      it "redirects to the proposal" do

        put :update, params: {id: proposal.to_param, proposal: valid_attributes}
        expect(response).to redirect_to(proposal)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      sign_in user
      proposal
    end

    it "destroys the requested proposal" do
      expect {
        delete :destroy, params: {id: proposal.to_param}
      }.to change(Proposal, :count).by(-1)
    end

    it "redirects to the proposals list" do
      delete :destroy, params: {id: proposal.to_param}
      expect(response).to redirect_to(proposals_url)
    end
  end

end
