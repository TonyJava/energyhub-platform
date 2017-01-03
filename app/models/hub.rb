class Hub < ApplicationRecord
  has_many :participants
  has_many :projects

  validates :name, presence: true

  def sites
    sites = []
    self.participants.each do |participant|
      participant.sites.each do |site|
        sites << site
      end
    end
    return sites
  end
end
