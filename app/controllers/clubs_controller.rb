class ClubsController < ApplicationController
  before_action :set_club, only: [:show ,:edit, :update, :destroy]
  load_and_authorize_resource except: :create

    skip_load_and_authorize_resource only: [:edit, :update]



  #load_and_authorize_resource
  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.where(active: true)
    @clubs_activ = Club.where(active: false)

  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show

  end

  # GET /clubs/new
  def new
    @club = Club.new
    if @club.address.nil?
      @club.build_address
    end


  end

  # GET /clubs/1/edit
  def edit
    authorize!(:edit, @club)
  end


  # POST /clubs
  # POST /clubs.json
  def create

    @club = Club.new(club_params)
    if (@club.active == true and current_user.has_role? :admin)
      @club.active = true
    else
      @club.active = false
    end
    if (current_user.has_role? :admin)
      #@club.user = club_params.user <- so wars vorher thorsten
      @club.user = User.find( club_params[:user_id])
    else
      @club.user = current_user
    end


    respond_to { |format|
      if @club.save

        format.html { redirect_to @club, notice: "Club was successfully created." }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    }
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update

    #authorize!(:update, @club)
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to clubs_path, notice: 'Club was successfully updated.' }
        format.json { render :index, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.address.destroy if @club.address.present?
    @club.events.destroy_all if @club.events.present?
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club

      @club = Club.find(params[:id])

    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :url, :user_id , :clubURL, :active , address_attributes: [:city, :postal_code, :street, :house_number, :country], beer_ids: [] )
    end
end
