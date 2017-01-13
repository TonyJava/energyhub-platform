class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:participant_confirmation]

  def home
    @hubs = Hub.all
    @projects = Project.order(created_at: :desc).take(6)
    @participants = Participant.order(created_at: :desc).take(6)
  end

  def participant_confirmation
    render layout: 'public_layout'
  end
end
