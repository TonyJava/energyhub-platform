class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  def show
    @project = @proposal.project
  end

  def edit
  end

  def update
    if @proposal.update(proposal_params)
      redirect_to @proposal, notice: 'Proposal was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to proposals_url, notice: 'Proposal was successfully destroyed.'
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:accepted?, :proposal_doc, :notes, proposal_steps_attributes: [:name, :step_completed, :id])
  end
end
