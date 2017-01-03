require 'rails_helper'

RSpec.describe Site, type: :model do
  let(:hub) { create(:hub) }
  let(:participant) { create(:participant, hub_id: hub.id) }
  let(:participant2) { create(:participant, hub_id: hub.id) }
  let(:site) { create(:site, participant_id: participant.id) }

  describe "Associations" do
    specify { should have_many :projects }
    specify { should belong_to :participant }
  end

  describe "Validations" do
    specify { should validate_presence_of(:city) }
    specify { should validate_presence_of(:state) }
  end

  describe "#address" do
    before(:each) do
      site
    end

    it "returns the corect string" do
      expect(site.address).to eq("250 6th St E ")
    end
  end
end
