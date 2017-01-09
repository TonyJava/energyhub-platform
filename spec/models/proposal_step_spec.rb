require 'rails_helper'

RSpec.describe ProposalStep, type: :model do
  describe "Associations" do
    specify { should belong_to :proposal }
  end

  describe "Validations" do
    specify { should validate_presence_of(:name) }
  end
end
