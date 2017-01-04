require 'rails_helper'

RSpec.describe "contractors/edit", type: :view do
  before(:each) do
    @contractor = assign(:contractor, Contractor.create!(
      :name => "MyString",
      :contact => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :states_serviced => "MyString"
    ))
  end

  it "renders the edit contractor form" do
    render

    assert_select "form[action=?][method=?]", contractor_path(@contractor), "post" do

      assert_select "input#contractor_name[name=?]", "contractor[name]"

      assert_select "input#contractor_contact[name=?]", "contractor[contact]"

      assert_select "input#contractor_email[name=?]", "contractor[email]"

      assert_select "input#contractor_phone[name=?]", "contractor[phone]"

      assert_select "input#contractor_states_serviced[name=?]", "contractor[states_serviced]"
    end
  end
end
