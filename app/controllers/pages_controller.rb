class PagesController < ApplicationController
  def home
    @hubs = Hub.all
    @projects = Project.order(created_at: :desc)
    @participants = Participant.order(created_at: :desc)
  end
end
