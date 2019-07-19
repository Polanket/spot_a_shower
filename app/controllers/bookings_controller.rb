class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    shower = Shower.find(params[:shower_id])

    @booking.user = current_user
    @booking.shower = shower

    if @booking.save
      redirect_to user_path(current_user)
    else
      render "showers/show"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.new(booking_params)
    @booking.update
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time)
  end
end
