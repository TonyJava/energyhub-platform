class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.all
  end

  def show
    @projects = @participant.projects
    @sites = @participant.sites
  end

  def new
    @participant = Participant.new
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

  # PATCH/PUT /participants/1
  def update
    if @participant.update(participant_params)
      redirect_to @participant, notice: 'Participant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /participants/1
  def destroy
    @participant.destroy
    redirect_to participants_url, notice: 'Participant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def participant_params
      params.require(:participant).permit(:hub_id, :first_name, :last_name, :email, :phone, :organization, :title, :notes)
    end
end
