require 'rails_helper'

RSpec.describe "hubs/new", type: :view do
  before(:each) do
    assign(:hub, Hub.new(
      :name => "MyString",
      :percent_fee => 1.5
    ))
  end

  it "renders new hub form" do
    render

    assert_select "form[action=?][method=?]", hubs_path, "post" do

      assert_select "input#hub_name[name=?]", "hub[name]"

      assert_select "input#hub_percent_fee[name=?]", "hub[percent_fee]"
    end
  end
end
