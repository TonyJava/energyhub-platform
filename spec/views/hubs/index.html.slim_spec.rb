require 'rails_helper'

RSpec.describe "hubs/index", type: :view do
  before(:each) do
    assign(:hubs, [
      Hub.create!(
        :name => "Name",
        :percent_fee => 2.5
      ),
      Hub.create!(
        :name => "Name",
        :percent_fee => 2.5
      )
    ])
  end

  it "renders a list of hubs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
