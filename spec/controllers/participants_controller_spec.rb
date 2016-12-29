require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  let(:user) { create(:user) }
  let(:participant) { create(:participant) }
  let(:valid_attributes) {
    FactoryGirl.build(:participant).attributes
  }

  describe "GET #index" do
    before(:each) do
      sign_in user
      participant
    end

    it "assigns all participants as @participants" do
      get :index, params: {}
      expect(assigns(:participants)).to eq([participant])
    end
  end

  describe "GET #show" do
    before(:each) do
      sign_in user
      participant
    end

    it "assigns the requested participant as @participant" do
      get :show, params: {id: participant.to_param}
      expect(assigns(:participant)).to eq(participant)
    end
  end

  describe "GET #new" do
    before(:each) do
      sign_in user
    end

    it "assigns a new participant as @participant" do
      get :new, params: {}
      expect(assigns(:participant)).to be_a_new(Participant)
    end
  end

  describe "GET #edit" do
    before(:each) do
      sign_in user
      participant
    end

    it "assigns the requested participant as @participant" do
      get :edit, params: {id: participant.to_param}
      expect(assigns(:participant)).to eq(participant)
    end
  end

  describe "POST #create" do
    before(:each) do
      sign_in user
    end

    context "with valid params" do
      it "creates a new Participant" do
        expect {
          post :create, params: {participant: valid_attributes}
        }.to change(Participant, :count).by(1)
      end

      it "assigns a newly created participant as @participant" do
        post :create, params: {participant: valid_attributes}
        expect(assigns(:participant)).to be_a(Participant)
        expect(assigns(:participant)).to be_persisted
      end

      it "redirects to the created participant" do
        post :create, params: {participant: valid_attributes}
        expect(response).to redirect_to(Participant.last)
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
      participant
    end

    context "with valid params" do
      let(:new_attributes) {
        { first_name: "Sheryl", last_name: "Sandberg"}
      }

      it "updates the requested participant" do
        put :update, params: {id: participant.to_param, participant: new_attributes}
        participant.reload
        expect(participant.first_name).to eq("Sheryl")
        expect(participant.last_name).to eq("Sandberg")
      end

      it "assigns the requested participant as @participant" do
        put :update, params: {id: participant.to_param, participant: valid_attributes}
        expect(assigns(:participant)).to eq(participant)
      end

      it "redirects to the participant" do
        put :update, params: {id: participant.to_param, participant: valid_attributes}
        expect(response).to redirect_to(participant)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      sign_in user
      participant
    end

    it "destroys the requested participant" do
      expect {
        delete :destroy, params: {id: participant.to_param}
      }.to change(Participant, :count).by(-1)
    end

    it "redirects to the participants list" do
      delete :destroy, params: {id: participant.to_param}
      expect(response).to redirect_to(participants_url)
    end
  end

end
