class OfficesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index

    if params[:search].nil? || params[:search] == ""
      @offices = Office.geocoded
    else
      @offices = Office.search_by_full_name(params[:search])
      # @offices = Office.geocoded.where("address ILIKE ?", "%#{params[:search]}%")
    end
    @markers = @offices.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude
      }
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

  def edit
    @office = Office.find(params[:id])
  end

  def update
    @office = Office.find(params[:id])
    @office.update(office_params)

    redirect_to office_path(@office)
  end

  private

  def search_params
    params.require(:search).permit(:search)
  end

  def office_params
    params.require(:office).permit(:name, :address, :description, :price, :photo)
  end
end
