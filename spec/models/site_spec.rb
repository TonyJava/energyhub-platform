require 'rails_helper'

RSpec.describe Site, type: :model do
  describe "Associations" do
    specify { should have_many :projects }
    specify { should belong_to :participant }
  end

  describe "Validations" do
    specify { should validate_presence_of(:city) }
    specify { should validate_presence_of(:state) }
  end
end
