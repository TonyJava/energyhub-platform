require 'rails_helper'

RSpec.describe Contractor, type: :model do
  describe "Associations" do
    specify { should have_many :proposals }
    specify { should have_many :projects }
  end

  describe "Validations" do
    specify { should validate_presence_of(:name) }
  end
end
