require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #home" do
    context "with valid user" do
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get :home
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "with an invalid user" do
    it "redirects the user" do
      get :home
      expect(response).to have_http_status(302)
    end
  end
end
