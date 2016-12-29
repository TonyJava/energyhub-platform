class HubsController < ApplicationController
  before_action :set_hub, only: [:show, :edit, :update, :destroy]

  # GET /hubs
  def index
    @hubs = Hub.all
  end

  # GET /hubs/1
  def show
  end

  # GET /hubs/new
  def new
    @hub = Hub.new
  end

  # GET /hubs/1/edit
  def edit
  end

  # POST /hubs
  def create
    @hub = Hub.new(hub_params)

    if @hub.save
      redirect_to @hub, notice: 'Hub was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hubs/1
  def update
    if @hub.update(hub_params)
      redirect_to @hub, notice: 'Hub was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hubs/1
  def destroy
    @hub.destroy
    redirect_to hubs_url, notice: 'Hub was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hub
      @hub = Hub.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hub_params
      params.require(:hub).permit(:name, :percent_fee)
    end
end
