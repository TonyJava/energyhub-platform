require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:valid_attributes) {
    FactoryGirl.build(:project).attributes
  }
  let(:invalid_attributes) {
    FactoryGirl.build(:project, project_type: nil).attributes
  }

  describe "GET #index" do
    before(:each) do
      sign_in user
      project
    end

    it "assigns all projects as @projects" do
      get :index, params: {}
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #show" do
    before(:each) do
      sign_in user
      project
    end

    it "assigns the requested project as @project" do
      get :show, params: {id: project.to_param}
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "GET #new" do
    before(:each) do
      sign_in user
    end

    it "assigns a new project as @project" do
      get :new, params: {}
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "GET #edit" do
    before(:each) do
      sign_in user
      project
    end

    it "assigns the requested project as @project" do
      get :edit, params: {id: project.to_param}
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    before(:each) do
      sign_in user
    end

    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, params: {project: valid_attributes}
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, params: {project: valid_attributes}
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end

      it "redirects to the created project" do
        post :create, params: {project: valid_attributes}
        expect(response).to redirect_to(Project.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        post :create, params: {project: invalid_attributes}
        expect(assigns(:project)).to be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        post :create, params: {project: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
      project
    end

    context "with valid params" do
      let(:new_attributes) {
        { project_type: "Wind" }
      }

      it "updates the requested project" do

        put :update, params: {id: project.to_param, project: new_attributes}
        project.reload
        expect(project.project_type).to eq("Wind")
      end

      it "assigns the requested project as @project" do

        put :update, params: {id: project.to_param, project: valid_attributes}
        expect(assigns(:project)).to eq(project)
      end

      it "redirects to the project" do

        put :update, params: {id: project.to_param, project: valid_attributes}
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do

        put :update, params: {id: project.to_param, project: invalid_attributes}
        expect(assigns(:project)).to eq(project)
      end

      it "re-renders the 'edit' template" do

        put :update, params: {id: project.to_param, project: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      sign_in user
      project
    end

    it "destroys the requested project" do
      expect {
        delete :destroy, params: {id: project.to_param}
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      delete :destroy, params: {id: project.to_param}
      expect(response).to redirect_to(projects_url)
    end
  end
end
