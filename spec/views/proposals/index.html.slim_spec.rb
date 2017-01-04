require 'rails_helper'

RSpec.describe "proposals/index", type: :view do
  before(:each) do
    assign(:proposals, [
      Proposal.create!(
        :accepted? => false,
        :proposal_doc => "Proposal Doc"
      ),
      Proposal.create!(
        :accepted? => false,
        :proposal_doc => "Proposal Doc"
      )
    ])
  end

  it "renders a list of proposals" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Proposal Doc".to_s, :count => 2
  end
end
