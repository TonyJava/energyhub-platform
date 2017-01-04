require 'rails_helper'

RSpec.describe Proposal, type: :model do
  describe "Associations" do
    specify { should belong_to :project }
    specify { should belong_to :contractor }
  end
end
