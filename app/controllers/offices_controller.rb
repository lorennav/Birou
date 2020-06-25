class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index

    if params[:search].nil? || params[:search] == ""
      @offices = Office.geocoded
      @markers = @offices.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude
      }
      end

    else
      @offices = Office.geocoded.where("address ILIKE ?", "%#{params[:search]}%")
      @markers = @offices.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude
      }
      end

    end
  end

  def show
    @office = Office.find(params[:id])
    @booking = Booking.new
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    @office.owner = current_user
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
