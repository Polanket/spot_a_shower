class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.new(booking_params)
    @booking.update
  end

  def delete
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time)
  end
end
