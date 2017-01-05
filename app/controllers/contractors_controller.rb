class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]

  def index
    @contractors = Contractor.all.order(:name)
  end

  def show
    @proposals = @contractor.proposals.order(:created_at)
  end

  def new
    @contractor = Contractor.new
  end

  def edit
  end

  def create
    @contractor = Contractor.new(contractor_params)

    if @contractor.save
      redirect_to @contractor, notice: 'Contractor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contractor.update(contractor_params)
      redirect_to @contractor, notice: 'Contractor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contractor.destroy
    redirect_to contractors_url, notice: 'Contractor was successfully destroyed.'
  end

  private

  def set_contractor
    @contractor = Contractor.find(params[:id])
  end

  def contractor_params
    params.require(:contractor).permit(:name, :contact, :email, :phone, :states_serviced)
  end
end
