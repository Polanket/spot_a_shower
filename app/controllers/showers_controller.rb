class ShowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :results]
  before_action :set_shower, only: [:show, :edit, :update, :destroy]

  def index
    @showers = Shower.all
  end

  def results
    showers = Shower.search_by_name_and_address(params[:query])
    @results = showers.where.not(latitude: nil, longitude: nil)

    @markers = @results.map do |result|
      {
        lat: result.latitude,
        lng: result.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { result: result })
      }
    end
  end

  def new
    @shower = Shower.new
  end

  def create
    @shower = Shower.new(shower_params)
    @shower.user = current_user
    if @shower.save
      current_user.owner = true
      redirect_to shower_path(@shower)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
    # @shower = Shower.new
  end

  def update
    if @shower.update(shower_params)
      redirect_to shower_path(@shower)
    else
      render :new
    end
  end

  def destroy
    @shower = Shower.find(params[:id])
    @shower.destroy

    redirect_to showers_path
  end

  private

  def shower_params
    params.require(:shower).permit(:title, :description, :address, :features, :price, :photo)
  end

  def set_shower
    @shower = Shower.find(params[:id])
  end
end
