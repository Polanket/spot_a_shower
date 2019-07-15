class ShowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_shower, only: [ :show, :edit, :update, :destroy]

  def index
    @showers = Shower.all
  end

  def new
    @shower = Shower.new
  end

  def create
    @shower = Shower.new(shower_params)
    @shower.user = current_user
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
    @shower = Shower.new(shower_params)
    @shower.user = current_user
    if @shower.save
      redirect_to shower_path(@shower)
    else
      render :new
    end
  end

  def destroy
    @shower.destroy

    redirect_to showers_path
  end

  def shower_params
    params.require(:shower).permit(:description, :address, :features, :price)
  end

  def set_shower
    @shower = Shower.find(params[:id])
  end
end
