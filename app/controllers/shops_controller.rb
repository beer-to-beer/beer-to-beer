class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: :create
  skip_load_and_authorize_resource only: [:edit, :update]

  def index
    @shops = Shop.all
  end

  def show
  end

  def new
    @shop = Shop.new
    address=@shop.build_address
  end

  def edit
    authorize!(:edit, @shop)
  end

  def create
    @shop = Shop.new(shop_params)

    respond_to { |format|
      if @shop.save

        format.html { redirect_to @shop, notice: "Shop was successfully created." }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    }
  end

  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to shops_path, notice: 'Shop was successfully updated.' }
        format.json { render :index, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shop.address.destroy if @shop.address.present?
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.require(:shop).permit(:name , address_attributes: [:city, :postal_code, :street, :house_number, :country], beer_ids: [] )
    end
end
