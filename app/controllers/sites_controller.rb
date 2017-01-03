class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def index
    @sites = Site.all
  end

  def show
    @projects = @site.projects
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = Site.new(site_params)

    if @site.save
      redirect_to @site, notice: 'Site was successfully created.'
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      redirect_to @site, notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_url, notice: 'Site was successfully destroyed.'
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:address_1, :address_2, :name, :city, :state, :zip_code, :property_type, :participant_id)
  end
end
