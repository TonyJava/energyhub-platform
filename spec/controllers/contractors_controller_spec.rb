require 'rails_helper'

RSpec.describe ContractorsController, type: :controller do
  let(:user) { create(:user) }
  let(:hub) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:site1) { create(:site, participant_id: participant.id) }
  let(:project) { site1.projects.create(FactoryGirl.build(:project).attributes) }
  let(:contractor) { create(:contractor) }
  let(:proposal) { create(:proposal, project_id: project.id, contractor_id: contractor.id) }

  let(:valid_attributes) {
    FactoryGirl.build(:contractor).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:contractor, name: nil).attributes
  }

  describe "GET #index" do
    before(:each) do
      sign_in user
      contractor
    end

    it "assigns all contractors as @contractors" do
      get :index, params: {}
      expect(assigns(:contractors)).to eq([contractor])
    end
  end

  describe "GET #show" do
    before(:each) do
      sign_in user
      contractor
    end

    it "assigns the requested contractor as @contractor" do
      get :show, params: {id: contractor.to_param}
      expect(assigns(:contractor)).to eq(contractor)
    end
  end

  describe "GET #new" do
    before(:each) do
      sign_in user
    end

    it "assigns a new contractor as @contractor" do
      get :new, params: {}
      expect(assigns(:contractor)).to be_a_new(Contractor)
    end
  end

  describe "GET #edit" do
    before(:each) do
      sign_in user
      contractor
    end

    it "assigns the requested contractor as @contractor" do
      get :edit, params: {id: contractor.to_param}
      expect(assigns(:contractor)).to eq(contractor)
    end
  end

  describe "POST #create" do
    before(:each) do
      sign_in user
    end

    context "with valid params" do
      it "creates a new Contractor" do
        expect {
          post :create, params: {contractor: valid_attributes}
        }.to change(Contractor, :count).by(1)
      end

      it "assigns a newly created contractor as @contractor" do
        post :create, params: {contractor: valid_attributes}
        expect(assigns(:contractor)).to be_a(Contractor)
        expect(assigns(:contractor)).to be_persisted
      end

      it "redirects to the created contractor" do
        post :create, params: {contractor: valid_attributes}
        expect(response).to redirect_to(Contractor.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contractor as @contractor" do
        post :create, params: {contractor: invalid_attributes}
        expect(assigns(:contractor)).to be_a_new(Contractor)
      end

      it "re-renders the 'new' template" do
        post :create, params: {contractor: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
      contractor
    end

    context "with valid params" do
      let(:new_attributes) {
        { contact: "Shirly Taylor" }
      }

      it "updates the requested contractor" do
        put :update, params: {id: contractor.to_param, contractor: new_attributes}
        contractor.reload
        expect(contractor.contact).to eq("Shirly Taylor")
      end

      it "assigns the requested contractor as @contractor" do
        put :update, params: {id: contractor.to_param, contractor: valid_attributes}
        expect(assigns(:contractor)).to eq(contractor)
      end

      it "redirects to the contractor" do
        put :update, params: {id: contractor.to_param, contractor: valid_attributes}
        expect(response).to redirect_to(contractor)
      end
    end

    context "with invalid params" do
      it "assigns the contractor as @contractor" do
        put :update, params: {id: contractor.to_param, contractor: invalid_attributes}
        expect(assigns(:contractor)).to eq(contractor)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: contractor.to_param, contractor: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      sign_in user
      contractor
    end

    it "destroys the requested contractor" do
      expect {
        delete :destroy, params: {id: contractor.to_param}
      }.to change(Contractor, :count).by(-1)
    end

    it "redirects to the contractors list" do
      delete :destroy, params: {id: contractor.to_param}
      expect(response).to redirect_to(contractors_url)
    end
  end

end
