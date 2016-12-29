require 'rails_helper'

RSpec.describe HubsController, type: :controller do
  let(:user) { create(:user) }
  let(:hub) { create(:hub) }
  let(:valid_attributes) {
    FactoryGirl.build(:hub).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:hub, name: nil).attributes
  }

  describe "GET #index" do
    before(:each) do
      sign_in user
      hub
    end

    it "assigns all hubs as @hubs" do
      get :index, params: {}
      expect(assigns(:hubs)).to eq([hub])
    end
  end

  describe "GET #show" do
    before(:each) do
      sign_in user
      hub
    end

    it "assigns the requested hub as @hub" do
      get :show, params: {id: hub.to_param}
      expect(assigns(:hub)).to eq(hub)
    end
  end

  describe "GET #new" do
    before(:each) do
      sign_in user
    end

    it "assigns a new hub as @hub" do
      get :new, params: {}
      expect(assigns(:hub)).to be_a_new(Hub)
    end
  end

  describe "GET #edit" do
    before(:each) do
      sign_in user
      hub
    end

    it "assigns the requested hub as @hub" do
      get :edit, params: {id: hub.to_param}
      expect(assigns(:hub)).to eq(hub)
    end
  end

  describe "POST #create" do
    before(:each) do
      sign_in user
    end

    context "with valid params" do
      it "creates a new Hub" do
        expect {
          post :create, params: {hub: valid_attributes}
        }.to change(Hub, :count).by(1)
      end

      it "assigns a newly created hub as @hub" do
        post :create, params: {hub: valid_attributes}
        expect(assigns(:hub)).to be_a(Hub)
        expect(assigns(:hub)).to be_persisted
      end

      it "redirects to the created hub" do
        post :create, params: {hub: valid_attributes}
        expect(response).to redirect_to(Hub.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved hub as @hub" do
        post :create, params: {hub: invalid_attributes}
        expect(assigns(:hub)).to be_a_new(Hub)
      end

      it "re-renders the 'new' template" do
        post :create, params: {hub: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
      hub
    end

    context "with valid params" do
      let(:new_attributes) {
        { name: "Hubbard County" }
      }

      it "updates the requested hub" do
        put :update, params: {id: hub.to_param, hub: new_attributes}
        hub.reload
        expect(hub.name).to eq("Hubbard County")
      end

      it "assigns the requested hub as @hub" do
        put :update, params: {id: hub.to_param, hub: valid_attributes}
        expect(assigns(:hub)).to eq(hub)
      end

      it "redirects to the hub" do
        put :update, params: {id: hub.to_param, hub: valid_attributes}
        expect(response).to redirect_to(hub)
      end
    end

    context "with invalid params" do
      it "assigns the hub as @hub" do
        put :update, params: {id: hub.to_param, hub: invalid_attributes}
        expect(assigns(:hub)).to eq(hub)
      end

      it "re-renders the 'edit' template" do

        put :update, params: {id: hub.to_param, hub: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      sign_in user
      hub
    end

    it "destroys the requested hub" do
      expect {
        delete :destroy, params: {id: hub.to_param}
      }.to change(Hub, :count).by(-1)
    end

    it "redirects to the hubs list" do
      delete :destroy, params: {id: hub.to_param}
      expect(response).to redirect_to(hubs_url)
    end
  end
end
