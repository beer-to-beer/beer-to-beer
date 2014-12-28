class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shops = Shop.all
    respond_with(@shops)
  end

  def show
    respond_with(@shop)
  end

  def new
    @shop = Shop.new
    address=@shop.build_address
    respond_with(@shop)
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    respond_with(@shop)
  end

  def update
    @shop.update(shop_params)
    respond_with(@shop)
  end

  def destroy
    @shop.destroy
    respond_with(@shop)
  end

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.require(:shop).permit(:name, :address_id)
    end
end
