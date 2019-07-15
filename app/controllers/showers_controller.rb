class ShowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @showers = Shower.all
  end

  def new
    @shower = Shower.new
  end

  def create
    @shower = Shower.new(shower_params)
    if @shower.save
      redirect_to shower_path(@shower)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def shower_params
    params.require(:shower).permit(:description, :address, :price, :features, :price)
  end
end
