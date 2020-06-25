class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
    @office = Office.find(params[:office_id])
  end

  def create
    @office = Office.find(params[:office_id])
    @category = params["booking"]["category"]
    @user = current_user
    booking = Booking.new(start_date: Time.now, end_date: Time.now + 3 ,office: @office, category: @category, user: @user)

    if booking.save
      redirect_to @office
    else
      raise
    end
  end

 #  category"=>""},
 # "commit"=>"Create Booking",
 # "office_id"=>"44"

  #  "start_date(2i)"=>"6",
  #  "start_date(3i)"=>"25",
  #  "start_date(4i)"=>"10",
  #  "start_date(5i)"=>"53",

  def edit
  end

  def update
  end

  def destroy
  end
end
