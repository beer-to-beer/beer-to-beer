class ProducersController < ApplicationController
  before_action :set_producer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: :create
  skip_load_and_authorize_resource only: [:edit, :update]

  def index
    @producers = Producer.all
  end

  def show
  end

  def new
    @producer = Producer.new
    address=@producer.build_address
  end

  def edit
    authorize!(:edit, @producer)
  end

  def create
    @producer = Producer.new(producer_params)

    respond_to { |format|
      if @producer.save

        format.html { redirect_to @producer, notice: "Producer was successfully created." }
        format.json { render :show, status: :created, location: @producer }
      else
        format.html { render :new }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    }
  end

  def update
    respond_to do |format|
      if @producer.update(producer_params)
        format.html { redirect_to producers_path, notice: 'Producer was successfully updated.' }
        format.json { render :index, status: :ok, location: @producer }
      else
        format.html { render :edit }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @producer.address.destroy if @producer.address.present?
    @producer.destroy
    respond_to do |format|
      format.html { redirect_to producers_url, notice: 'Producer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_producer
    @producer = Producer.find(params[:id])
  end

  def producer_params
    params.require(:producer).permit(:name , address_attributes: [:city, :postal_code, :street, :house_number, :country] )
  end
end
