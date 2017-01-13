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
        participant = Participant.where(last_name: row['last_name']).first_or_initialize
        participant.hub_id = Hub.where(name: row['hub']).first.id
        participant.first_name = row['first_name']
        participant.email = row['email']
        participant.phone = row['phone_number']
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
        project = Project.where(name: row['project_name']).first_or_initialize
        project.project_type = row['project_type']
        project.project_status = row['project_status']
        project.save!
        puts "Updated info for project #{project.name}"
        if SiteProject.where("site_id = ? AND project_id = ?", site.id, project.id).first
          site_project = SiteProject.where("site_id = ? AND project_id = ?", site.id, project.id).first
        else
          site_project = SiteProject.create(site_id: site.id, project_id: project.id)
        end
        puts "Added project #{site_project.project.name} to site #{site_project.site.name}"
        
        if Proposal.where("contractor_id = ? AND project_id = ?", contractor.id, project.id).first
          proposal = Proposal.where("contractor_id = ? AND project_id = ?", contractor.id, project.id).first
        else
          proposal = Proposal.create(contractor_id: contractor.id, project_id: project.id)
        end
        puts "Updated info for proposal for #{project.name} and #{contractor.name}"
        if row['proposal_step_initiated']
          proposal.proposal_steps.where(name: ProposalStep::INITIATED).first.update(step_completed: Date.strptime(row['proposal_step_initiated'], "%m/%d/%Y"))
        end
        if row['proposal_step_presented']
          proposal.proposal_steps.where(name: ProposalStep::PROPOSAL_PRESENTED).first.update(step_completed: Date.strptime(row['proposal_step_presented'], "%m/%d/%Y"))
        end
        if row['proposal_step_selected']
          proposal.proposal_steps.where(name: ProposalStep::SELECTED).first.update(step_completed: Date.strptime(row['proposal_step_selected'], "%m/%d/%Y"))
        end
        if row['proposal_step_closed']
          proposal.proposal_steps.where(name: ProposalStep::CLOSED_NOT_SELECTED).first.update(step_completed: Date.strptime(row['proposal_step_closed'], "%m/%d/%Y"))
        end
        puts "Updated proposal_steps for project #{project.name} and #{proposal.proposal_steps.where.not(step_completed: nil).count} proposal steps"
      end
    else
      Rails.logger.error "A CSV is required to load this data."
      return
    end
  end
end