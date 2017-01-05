require 'rails_helper'

RSpec.describe Hub, type: :model do
  let(:hub) { create(:hub) }
  let(:hub2) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:site1) { create(:site, participant_id: participant.id) }
  let(:site2) { create(:site, participant_id: participant.id) }
  let(:project1) { site1.projects.create(FactoryGirl.build(:project).attributes) }
  let(:project2) { site1.projects.create(FactoryGirl.build(:project, name: "Solar Parking Shade Structure").attributes) }

  describe "Associations" do
    specify { should have_many :participants }
  end

  describe "Validations" do
    specify { should validate_presence_of(:name) }
  end

  describe "#sites" do
    before(:each) do
      site1
      site2
    end 
    
    it "returns the correct number of sites" do
      expect(hub.sites.count).to eq(2)
    end

    it "returns an empty array when no sites" do
      expect(hub2.sites).to eq([])
    end
  end

  describe "#projects" do
    before(:each) do
      project1
      project2
    end 
    
    it "returns the correct number of projects" do
      expect(hub.projects.count).to eq(2)
    end

    it "returns an empty array when no projects" do
      expect(hub2.projects).to eq([])
    end
  end
end
