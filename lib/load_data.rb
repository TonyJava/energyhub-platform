require 'csv'
require 'open-uri'

class LoadData
  def self.read_and_load_csv
    dir = "data"
    file = File.join(dir, "project_data.csv")
    if file
      CSV.parse(open(file).read, headers: true) do |row|
        # Add Hub
        hub = Hub.where(name: row['hub']).first_or_create
        puts "Updated info for hub #{hub.name}"
        # Add fields to a new participant
        participant = Participant.where(email: row['email']).first_or_initialize
        participant.hub_id = Hub.where(name: row['hub']).first.id
        participant.first_name = row['first_name']
        participant.last_name = row['last_name']
        participant.phone = row['phone']
        participant.organization = (row['organization'])
        participant.title = row['title']
        participant.notes = row['participant_notes']
        participant.save!
        puts "Updated info for participant #{participant.full_name}"
        # Create site and add fields to a new site
        site = Site.where(name: row['site_name']).first_or_initialize
        site.participant_id = Participant.where(last_name: row['last_name']).first.id
        site.address_1 = row['address_1']
        site.address_2 = row['address_2']
        site.city = row['city']
        site.state = row['state']
        site.zip_code = row['zip_code']
        site.property_type = row['property_type']
        site.save!
        puts "Updated info for site #{site.name}"
        # Create contractor
        contractor = Contractor.where(name: row['contractor_name']).first_or_create!
        puts "Updated info for #{contractor.name}"
        # Create project and add fields to new project
        project = site.projects.where(name: row['project_name']).first_or_initialize
        project.name = row['project_name'] ? row['project_name'] : row['site_name']
        project.project_type = row['project_type']
        project.project_status = "Active"
        project.save!
        site.save!
        puts "Updated info for project #{project.name}"
      end
    else
      Rails.logger.error "A CSV is required to load this data."
      return
    end
  end
end