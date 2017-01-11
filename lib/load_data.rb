require 'csv'
require 'open-uri'

class LoadData
  def self.read_and_load_csv
    dir = "data"
    file = File.join(dir, "dealerships.csv")
    if file
      CSV.parse(open(file).read, headers: true) do |row|
        # Add fields to a new participant
        participant = Participant.where(email: row['email']).first_or_initialize
        participant.first_name = row['first_name']
        participant.last_name = row['last_name']
        participant.phone = row['phone']
        participant.organization = (row['organization'])
        participant.title = row['title']
        participant.notes = row['notes']
        participant.save
        # Create site and add fields to a new site
        site = participant.sites.where(name: row['name']).first_or_initialize
        site.address_1 = row['address_1']
        site.address_2 = row['address_2']
        site.city = row['city']
        site.state = row['state']
        site.zip_code = row['zip_code']
        site.propery_type = row['propery_type']
        site.domain_name = row['Domain URL']
        site.save!
        puts "Updated info for #{participant.full_name} and site #{site.name}"
      end
    else
      Rails.logger.error "A list of dealerships is required before the import can run. Download the latest version from the automotiontv-build-tools repo and drop it in the data folder."
      return
    end
  end