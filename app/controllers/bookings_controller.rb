class BookingsController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @bookings = @user.bookings
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    # only so that simple form create the right route /yachts/12/bookings
    @yacht = Yacht.find(params[:yacht_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @yacht = Yacht.find(params[:yacht_id])
    @booking.yacht = @yacht
    @booking.user = current_user
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking)
          .permit(:start_date, :end_date, :number_of_guests, :value_of_booking)
  end
end
