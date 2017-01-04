require 'rails_helper'

RSpec.describe "contractors/show", type: :view do
  before(:each) do
    @contractor = assign(:contractor, Contractor.create!(
      :name => "Name",
      :contact => "Contact",
      :email => "Email",
      :phone => "Phone",
      :states_serviced => "States Serviced"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/States Serviced/)
  end
end
