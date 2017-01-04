require 'rails_helper'

RSpec.describe "proposals/show", type: :view do
  before(:each) do
    @proposal = assign(:proposal, Proposal.create!(
      :accepted? => false,
      :proposal_doc => "Proposal Doc"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Proposal Doc/)
  end
end
