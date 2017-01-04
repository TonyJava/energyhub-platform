require 'rails_helper'

RSpec.describe "contractors/index", type: :view do
  before(:each) do
    assign(:contractors, [
      Contractor.create!(
        :name => "Name",
        :contact => "Contact",
        :email => "Email",
        :phone => "Phone",
        :states_serviced => "States Serviced"
      ),
      Contractor.create!(
        :name => "Name",
        :contact => "Contact",
        :email => "Email",
        :phone => "Phone",
        :states_serviced => "States Serviced"
      )
    ])
  end

  it "renders a list of contractors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "States Serviced".to_s, :count => 2
  end
end
