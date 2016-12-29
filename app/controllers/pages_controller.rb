class PagesController < ApplicationController
  def home
    @hubs = Hub.all
  end
end
