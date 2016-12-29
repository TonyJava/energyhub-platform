require 'rails_helper'

RSpec.describe Hub, type: :model do
  describe "Associations" do
    specify { should have_many :participants }
  end

  describe "Validations" do
    specify { should validate_presence_of(:name) }
  end
end
