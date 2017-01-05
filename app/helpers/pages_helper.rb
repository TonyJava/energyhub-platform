module PagesHelper
  def project_summary(project)
    if project.hub
      return "<p>
        #{link_to project.name, project_path(id: project.id)} created in
        #{link_to project.hub.name, hub_path(id: project.hub.id)}
        <br>
        Date:  #{project.created_at.to_formatted_s(:long)}
      </p>".html_safe
    else
      return "<p>
        #{link_to project.name, project_path(id: project.id)} created
        <br>
        Date:  #{project.created_at.to_formatted_s(:long)}
      </p>".html_safe
    end
  end

  def participant_summary(participant)
    if participant.hub
      return "<p>
        #{link_to participant.full_name, participant_path(id: participant.id)} created in
        #{link_to participant.hub.name, hub_path(id: participant.hub.id)}
        <br>
        Date:  #{participant.created_at.to_formatted_s(:long)}
      </p>".html_safe
    else
      return "<p>
        #{link_to participant.name, participant_path(id: participant.id)} created
        <br>
        Date:  #{participant.created_at.to_formatted_s(:long)}
      </p>".html_safe
    end
  end
end
