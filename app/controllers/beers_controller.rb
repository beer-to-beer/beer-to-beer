class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @beers = Beer.all
    respond_with(@beers)
  end

  def show
    respond_with(@beer)
  end

  def new
    @beer = Beer.new
    respond_with(@beer)
  end

  def edit
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.save
    respond_with(@beer)
  end

  def update
    @beer.update(beer_params)
    respond_with(@beer)
  end

  def destroy
    @beer.destroy
    respond_with(@beer)
  end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end

    def beer_params
      params.require(:beer).permit(:title)
    end
end
