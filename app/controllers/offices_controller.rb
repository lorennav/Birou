class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    if params[:search].nil? || params[:search] == ""
      @offices = Office.all
    else
      @offices = Office.where(address: params[:search])
    end
  end

  def show
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  private

  def office_params
    params.require(:office).permit(:name, :address, :description, :price, :photo)
  end
end
