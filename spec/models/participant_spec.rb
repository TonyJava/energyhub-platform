require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe "Associations" do
    specify { should belong_to :hub }
  end
end
