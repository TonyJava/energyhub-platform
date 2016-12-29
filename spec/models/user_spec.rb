require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    specify { should validate_presence_of(:email) }
    specify { should validate_presence_of(:first_name) }
    specify { should validate_presence_of(:last_name) }
  end
end
