require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:hub) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:participant2) { create(:participant, hub_id: hub.id) }
  let(:site1) { create(:site, participant_id: participant.id) }
  let(:project) { site1.projects.create(FactoryGirl.build(:project).attributes) }

  describe "Associations" do
    specify { should have_many :sites }
    specify { should have_many :proposals }
    specify { should have_many :contractors }
  end

  describe "Validations" do
    specify { should validate_presence_of(:name) }
    specify { should validate_presence_of(:project_status) }
    specify { should validate_presence_of(:project_type) }
  end

  describe "#hub" do
    before(:each) do
      project
    end

    it "returns the correct hub" do
      expect(project.hub.name).to eq("Beltrami County")
    end
  end
end
