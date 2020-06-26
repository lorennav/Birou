class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @office = Office.find(params[:office_id])
  end

  def create
    office = Office.find(params[:office_id])
    category = params["booking"]["category"]
    user = current_user
    start_date = params[:booking][:start_date]
    end_date = params[:booking][:end_date]
    booking = Booking.new(start_date: start_date, end_date: end_date, office: office, category: category, user: user)
    if booking.save
      redirect_to office
    else
      redirect_to new_office_booking_path(office)
    end
  end

  def edit
    @office = Office.find(params[:office_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect to @booking
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url
  end

  private
  def booking_params
    params.require(:booking).permit(:office_id, :start_date, :end_date, :category, :user)
  end
end
