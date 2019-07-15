class ShowersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @showers = Shower.all
  end

  def new
    @shower = Shower.new
  end

  def create

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
