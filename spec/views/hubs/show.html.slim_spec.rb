require 'rails_helper'

RSpec.describe "hubs/show", type: :view do
  before(:each) do
    @hub = assign(:hub, Hub.create!(
      :name => "Name",
      :percent_fee => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
  end
end
