require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) {
    FactoryGirl.build(:user).attributes
  }
  let(:invalid_attributes) {
    FactoryGirl.build(:user, email: nil).attributes
  }

  describe "GET #index" do
    before(:each) do
      sign_in user
    end

    it "assigns all users as @users" do
      get :index, params: {}
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    before(:each) do
      sign_in user
    end

    it "assigns the requested user as @user" do
      get :show, params: {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #new" do
    before(:each) do
      sign_in user
    end

    it "assigns a new user as @user" do
      get :new, params: {}
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    let(:user2) { create(:user) }

    before(:each) do
      sign_in user
    end

    it "assigns the requested user as @user" do
      get :edit, params: {id: user2.to_param}
      expect(assigns(:user)).to eq(user2)
    end
  end

  describe "PUT #update" do
    before(:each) do
      sign_in user
    end

    context "with valid params" do
      let(:new_attributes) {
        { first_name: "Sheryl", last_name: "Sandberg" }
      }

      it "updates the requested user" do
        put :update, params: {id: user.to_param, user: new_attributes}
        user.reload
        expect(user.first_name).to eq("Sheryl")
        expect(user.last_name).to eq("Sandberg")
      end

      it "assigns the requested user as @user" do
        put :update, params: {id: user.to_param, user: valid_attributes}
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        put :update, params: {id: user.to_param, user: valid_attributes}
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        put :update, params: {id: user.to_param, user: invalid_attributes}
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: user.to_param, user: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user2) { create(:user) }

    before(:each) do
      sign_in user
      user2
    end

    it "destroys the requested user" do
      expect {
        delete :destroy, params: {id: user2.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, params: {id: user2.to_param}
      expect(response).to redirect_to(users_url)
    end
  end
end
