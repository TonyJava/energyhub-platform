require 'rails_helper'

RSpec.describe "proposals/edit", type: :view do
  before(:each) do
    @proposal = assign(:proposal, Proposal.create!(
      :accepted? => false,
      :proposal_doc => "MyString"
    ))
  end

  it "renders the edit proposal form" do
    render

    assert_select "form[action=?][method=?]", proposal_path(@proposal), "post" do

      assert_select "input#proposal_accepted?[name=?]", "proposal[accepted?]"

      assert_select "input#proposal_proposal_doc[name=?]", "proposal[proposal_doc]"
    end
  end
end
