class RostersController < ApplicationController
  #before_action :set_user, only: [:calendar]

  # displays iframe containing the Google Calendar named Littlehumans
  # GET /rosters
  # GET /rosters.json
  def index
    @rosters = current_user.rosters.all
  end

  # creates a new event on Google Calendar named 'Littlehumans'
  # POST /rosters/new_event
  def new_event
    @roster = current_user.rosters.new(roster_params)

    cal = ClientGoogleCalendar::client_google_calendar

    #logger.info("roster is *** #{@roster.to_json}")
    #logger.info("name_shift is *** #{@roster["name_shift"]}")
    event = cal.create_event do |e|
      e.title = @roster["name_shift"]
      e.where = @roster["name_location_shift"] + ", " + @roster["name_location_hospital"]
      e.start_time = @roster["time_shift_start"]
      e.end_time = @roster["time_shift_end"]
    end
    #logger.info("cal events is *** #{cal.events.to_json}") # display in rails console

    respond_to do |format|
        format.html { redirect_to user_path(current_user), :notice => 'calendar event created.' }
    end
  end

  # delete an event from Google Calendar named Littlehumans
  def delete_event
    # parameter passed from _load_calendar.js.erb containing data json with event id to delete 
    @roster = current_user.rosters.new(roster_params)

    cal = ClientGoogleCalendar::client_google_calendar

    # find event id 
    event_id = @roster["name_shift"]
    event = cal.find_or_create_event_by_id(event_id)

    cal.delete_event(event)

    respond_to do |format|
        format.json { render :json => @url_resp.to_json }
        format.html { redirect_to user_path(current_user), :notice => 'httparty response errors.' }
    end
  end

  # displays all Google Calendar events from calendar named Littlehumans except ignored ones 
  def show
    # obtain parsed Google Calendar API with pre-defined calendar id using key/secret
    @url_resp = ClientGoogle::client_google
    #logger.info("url_httparty response is *** #{@url_resp.to_json}") 
    #binding.pry
    respond_to do |format|
        format.json { render :json => @url_resp.to_json }
        format.html { redirect_to user_path(current_user), :notice => 'httparty response errors.' }
    end
  end

  # GET /rosters/new
  def new
    @roster = current_user.rosters.new
  end

  # DRAFT 
  # edit an existing Google Calendar event on calendar Littlehumans
  def edit
    # parameters passed from _load_calendar.js.erb containing data json to edit the event with
    @roster = current_user.rosters.new(roster_params)

    cal = ClientGoogleCalendar::client_google_calendar

    # find event id passed in 
    event = cal.find_or_create_event_by_id(@roster["name_shift"]) do |e|
      # edit the attributes of the event id similar to when creating an event
      e.title = 'AAA' # hard coded example
    end

    respond_to do |format|
        format.json { render :json => event.to_json }
        format.html { redirect_to user_path(current_user), :notice => 'httparty response errors.' }
    end
  end

  # POST /rosters
  # POST /rosters.json
  def create 
    @roster = current_user.rosters.new(roster_params)

    respond_to do |format|
      if @roster.save
        format.html { redirect_to @roster, :notice => 'Roster was successfully created.' }
        format.json { render :action => "show", :status => :created, :location => @roster }
      else
        format.html { render :action => "new" }
        format.json { render :json => @roster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rosters/1
  # PATCH/PUT /rosters/1.json
  def update
    respond_to do |format|
      if @roster.update(roster_params)
        format.html { redirect_to @roster, :notice => 'Roster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => 'edit' }
        format.json { render :json => @roster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rosters/1
  # DELETE /rosters/1.json
  def destroy
    @roster.destroy

    respond_to do |format|
      format.html { redirect_to rosters_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def roster_params 
    # http://guides.rubyonrails.org/action_controller_overview.html#more-examples
    params.fetch(:roster, {}).permit(:name_shift, :name_location_hospital, :name_location_shift, :time_shift_start, :time_shift_end, :time_shift_duration)
  end
end
