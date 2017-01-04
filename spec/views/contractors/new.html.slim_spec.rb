require 'rails_helper'

RSpec.describe "contractors/new", type: :view do
  before(:each) do
    assign(:contractor, Contractor.new(
      :name => "MyString",
      :contact => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :states_serviced => "MyString"
    ))
  end

  it "renders new contractor form" do
    render

    assert_select "form[action=?][method=?]", contractors_path, "post" do

      assert_select "input#contractor_name[name=?]", "contractor[name]"

      assert_select "input#contractor_contact[name=?]", "contractor[contact]"

      assert_select "input#contractor_email[name=?]", "contractor[email]"

      assert_select "input#contractor_phone[name=?]", "contractor[phone]"

      assert_select "input#contractor_states_serviced[name=?]", "contractor[states_serviced]"
    end
  end
end
