require 'rails_helper'

RSpec.describe Participant, type: :model do
  let(:hub) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:participant2) { create(:participant, hub_id: hub.id) }
  let(:site1) { create(:site, participant_id: participant.id) }
  let(:site2) { create(:site, participant_id: participant.id) }
  let(:project) { site1.projects.create(FactoryGirl.build(:project).attributes) }
  let(:project2) { site1.projects.create(FactoryGirl.build(:project, name: "Solar Parking Shade Structure").attributes) }
  let(:project3) { site2.projects.create(FactoryGirl.build(:project).attributes) }

  describe "Associations" do
    specify { should belong_to :hub }
    specify { should have_many :sites }
  end

  describe "Validations" do
    specify { should validate_presence_of(:first_name) }
    specify { should validate_presence_of(:last_name) }
  end

  describe "#projects" do
    before(:each) do
      project
      project2
      project3
    end 
    
    it "returns the correct number of projects" do
      expect(participant.projects.count).to eq(3)
    end

    it "returns an empty array when no projects" do
      expect(participant2.projects).to eq([])
    end
  end

  describe "#full_name" do
    it "returns the corect string" do
      expect(participant.full_name).to eq("Elon Musk")
    end
  end
end
