class BookingsController < ApplicationController
  def index
    # user = current_user
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
    booking = Booking.new(start_date: start_date, end_date: end_date, office: office, category: category, user: user )

    if booking.save
      redirect_to office
    else
      redirect_to new_office_booking_path(office)
    end
  end

 #  category"=>""},
 # "commit"=>"Create Booking",
 # "office_id"=>"44"


  def edit
  end

  def update
  end

  def destroy
  end
end
