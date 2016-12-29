class HubsController < ApplicationController
  before_action :set_hub, only: [:show, :edit, :update, :destroy]

  def index
    @hubs = Hub.all
  end

  def show
  end

  def new
    @hub = Hub.new
  end

  def edit
  end

  def create
    @hub = Hub.new(hub_params)
    if @hub.save
      redirect_to @hub, notice: 'Hub was successfully created.'
    else
      render :new
    end
  end

  def update
    if @hub.update(hub_params)
      redirect_to @hub, notice: 'Hub was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hub.destroy
    redirect_to hubs_url, notice: 'Hub was successfully destroyed.'
  end

  private

  def set_hub
    @hub = Hub.find(params[:id])
  end

  def hub_params
    params.require(:hub).permit(:name, :percent_fee)
  end
end
