class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: :create
  skip_load_and_authorize_resource only: [:new, :create]
  # GET /events
  # GET /events.json
  def index
    @events = Event.joins(:club).where('clubs.active is ? and events.sdate > ?', true, Date.current)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    if Club.where(user_id: current_user.id, id: params[:club_id] ).count == 1
      @event = Event.new
    elsif current_user.has_role? :admin
      @event = Event.new
    else
      authorize! :create, Event
    end

  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    #authorize! :create, Event
    @event = Event.new(event_params)



    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json


  def destroy

    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :sdate, :imageURL, :club_id)
    end
end
