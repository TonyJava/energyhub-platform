require 'rails_helper'

RSpec.describe "proposals/new", type: :view do
  before(:each) do
    assign(:proposal, Proposal.new(
      :accepted? => false,
      :proposal_doc => "MyString"
    ))
  end

  it "renders new proposal form" do
    render

    assert_select "form[action=?][method=?]", proposals_path, "post" do

      assert_select "input#proposal_accepted?[name=?]", "proposal[accepted?]"

      assert_select "input#proposal_proposal_doc[name=?]", "proposal[proposal_doc]"
    end
  end
end
