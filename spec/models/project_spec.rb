require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "Associations" do
    specify { should have_many :sites }
  end

  describe "Validations" do
    specify { should validate_presence_of(:project_type) }
  end
end
