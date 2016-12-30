require 'rails_helper'

RSpec.describe SiteProject, type: :model do
  describe "Associations" do
    specify { should belong_to :site }
    specify { should belong_to :project }
  end
end
