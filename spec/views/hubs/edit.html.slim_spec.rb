require 'rails_helper'

RSpec.describe "hubs/edit", type: :view do
  before(:each) do
    @hub = assign(:hub, Hub.create!(
      :name => "MyString",
      :percent_fee => 1.5
    ))
  end

  it "renders the edit hub form" do
    render

    assert_select "form[action=?][method=?]", hub_path(@hub), "post" do

      assert_select "input#hub_name[name=?]", "hub[name]"

      assert_select "input#hub_percent_fee[name=?]", "hub[percent_fee]"
    end
  end
end
