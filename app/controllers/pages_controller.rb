class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:participant_confirmation]

  def home
    @hubs = Hub.all
    @projects = Project.order(created_at: :desc)
    @participants = Participant.order(created_at: :desc)
  end

  def participant_confirmation
    render layout: 'public_layout'
  end
end
