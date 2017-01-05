require 'rails_helper'

RSpec.describe PagesHelper, type: :helper do
  let(:hub) { create(:hub) }
  let(:hub2) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:site) { create(:site, participant_id: participant.id) }
  let(:project) { site.projects.create(FactoryGirl.build(:project).attributes) }

  describe "#project_summary" do
    before(:each) do
      project
    end

    it "returns the correct string" do
      expect(project_summary(project)).to include("Roof Solar Project")
    end
  end

  describe "#participant_summary" do
    before(:each) do
      participant
    end

    it "returns the correct string" do
      expect(participant_summary(participant)).to include("Elon Musk")
    end
  end
end
