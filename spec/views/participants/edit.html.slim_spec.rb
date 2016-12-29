require 'rails_helper'

RSpec.describe "participants/edit", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :hub_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :organization => "MyString",
      :title => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit participant form" do
    render

    assert_select "form[action=?][method=?]", participant_path(@participant), "post" do

      assert_select "input#participant_hub_id[name=?]", "participant[hub_id]"

      assert_select "input#participant_first_name[name=?]", "participant[first_name]"

      assert_select "input#participant_last_name[name=?]", "participant[last_name]"

      assert_select "input#participant_email[name=?]", "participant[email]"

      assert_select "input#participant_phone[name=?]", "participant[phone]"

      assert_select "input#participant_organization[name=?]", "participant[organization]"

      assert_select "input#participant_title[name=?]", "participant[title]"

      assert_select "textarea#participant_notes[name=?]", "participant[notes]"
    end
  end
end
