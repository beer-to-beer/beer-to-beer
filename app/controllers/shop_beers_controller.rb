class ShopBeersController < ApplicationController
  before_action :set_shop_beer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shop_beers = ShopBeer.all
    respond_with(@shop_beers)
  end

  def show
    respond_with(@shop_beer)
  end

  def new
    @shop_beer = ShopBeer.new
    respond_with(@shop_beer)
  end

  def edit
  end

  def create
    @shop_beer = ShopBeer.new(shop_beer_params)
    @shop_beer.save
    respond_with(@shop_beer)
  end

  def update
    @shop_beer.update(shop_beer_params)
    respond_with(@shop_beer)
  end

  def destroy
    @shop_beer.destroy
    respond_with(@shop_beer)
  end

  private
    def set_shop_beer
      @shop_beer = ShopBeer.find(params[:id])
    end

    def shop_beer_params
      params.require(:shop_beer).permit(:shop_id, :beer_id)
    end
end
