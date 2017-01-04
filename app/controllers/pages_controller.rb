class PagesController < ApplicationController
  def home
    @hubs = Hub.all
    @projects = Project.all 
    @participants = Participant.all
  end
end
