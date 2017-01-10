class ParticipantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new_hub_participant, :create_hub_participant]
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.all.order(:last_name)
  end

  def show
    @projects = @participant.projects
    @sites = @participant.sites
  end

  def new
    @participant = Participant.new
  end

  def new_hub_participant
    @participant = Participant.new
    @site = @participant.sites.build
    @hub = Hub.find(params[:hub_id])
    render layout: 'public_layout'
  end

  def edit
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to @participant, notice: 'Participant was successfully created.'
    else
      render :new
    end
  end

  def create_hub_participant
    @hub = Hub.find(params[:hub_id])
    @participant = Participant.new(hub_participant_params) 
    if @participant.save
      redirect_to participant_confirmation_path, notice: 'Participant was successfully created.'
    else
      render :new_hub_participant
    end
  end

  def update
    if @participant.update(participant_params)
      redirect_to @participant, notice: 'Participant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @participant.destroy
    redirect_to participants_url, notice: 'Participant was successfully destroyed.'
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(:hub_id, :first_name, :last_name, :email, :phone, :organization, :title, :notes)
  end

  def hub_participant_params
    params.require(:participant).permit(
      :hub_id, 
      :first_name, 
      :last_name, 
      :email, 
      :phone, 
      :organization, 
      :title, 
      :notes, 
      sites_attributes: [:name, :address_1, :address_2, :city, :state, :zip_code, :property_type]
      )
  end
end
