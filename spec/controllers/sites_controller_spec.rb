require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  let(:user) { create(:user) }
  let(:hub) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:participant2) { create(:participant, hub_id: hub.id) }
  let(:site) { create(:site, participant_id: participant.id) }
  let(:site2) { create(:site, participant_id: participant.id) }
  let(:project) { site.projects.create(FactoryGirl.build(:project).attributes) }
  let(:project2) { site.projects.create(FactoryGirl.build(:project, name: "Solar Parking Shade Structure").attributes) }
  let(:valid_attributes) {
    FactoryGirl.build(:site).attributes
  }
  let(:invalid_attributes) {
    FactoryGirl.build(:site, city: nil).attributes
  }

  describe "GET #index" do
    before(:each) do
      sign_in user
      site
    end    

    it "assigns all sites as @sites" do
      get :index, params: {}
      expect(assigns(:sites)).to eq([site])
    end
  end

  describe "GET #show" do
    before(:each) do
      sign_in user
      project
      project2
    end

    it "assigns the requested site as @site" do
      get :show, params: {id: site.to_param}
      expect(assigns(:site)).to eq(site)
    end

    it "assigns the requested site's projects as @projects" do
      get :show, params: {id: site.to_param}
      expect(assigns(:projects)).to eq(site.projects)
    end
  end

  describe "GET #new" do
    before(:each) do
      sign_in user
    end

    it "assigns a new site as @site" do
      get :new, params: {}
      expect(assigns(:site)).to be_a_new(Site)
    end
  end

  describe "GET #edit" do
    before(:each) do
      sign_in user
      site
    end

    it "assigns the requested site as @site" do
      get :edit, params: {id: site.to_param}
      expect(assigns(:site)).to eq(site)
    end
  end

  describe "POST #create" do
    before(:each) do
      sign_in user
    end

    context "with valid params" do
      it "creates a new Site" do
        expect {
          post :create, params: {site: valid_attributes}
        }.to change(Site, :count).by(1)
      end

      it "assigns a newly created site as @site" do
        post :create, params: {site: valid_attributes}
        expect(assigns(:site)).to be_a(Site)
        expect(assigns(:site)).to be_persisted
      end

      it "redirects to the created site" do
        post :create, params: {site: valid_attributes}
        expect(response).to redirect_to(Site.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved site as @site" do
        post :create, params: {site: invalid_attributes}
        expect(assigns(:site)).to be_a_new(Site)
      end

      it "re-renders the 'new' template" do
        post :create, params: {site: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
      site
    end

    context "with valid params" do
      let(:new_attributes) {
        { name: "River West Apartments"}
      }

      it "updates the requested site" do
        put :update, params: {id: site.to_param, site: new_attributes}
        site.reload
        expect(site.name).to eq("River West Apartments")
      end

      it "assigns the requested site as @site" do
        put :update, params: {id: site.to_param, site: valid_attributes}
        expect(assigns(:site)).to eq(site)
      end

      it "redirects to the site" do
        put :update, params: {id: site.to_param, site: valid_attributes}
        expect(response).to redirect_to(site)
      end
    end

    context "with invalid params" do
      it "assigns the site as @site" do
        put :update, params: {id: site.to_param, site: invalid_attributes}
        expect(assigns(:site)).to eq(site)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: site.to_param, site: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      sign_in user
      site
    end

    it "destroys the requested site" do
      expect {
        delete :destroy, params: {id: site.to_param}
      }.to change(Site, :count).by(-1)
    end

    it "redirects to the sites list" do
      delete :destroy, params: {id: site.to_param}
      expect(response).to redirect_to(sites_url)
    end
  end

end
