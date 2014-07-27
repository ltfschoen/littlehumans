class RostersController < ApplicationController
  #before_action :set_user, only: [:calendar]

  # GET /rosters
  # GET /rosters.json
  def index
    @rosters = current_user.rosters.all

    # TO-DO - shift to post action area
    @roster = current_user.rosters.new(roster_params)

    if params[:filter] != "view" # do not run this if use clicks to "view" the calendar

      require 'rubygems'
      require 'google_calendar'

      cal = Google::Calendar.new(:username => ENV['G_USER'],
                                 :password => ENV['G_PASS'],
                                 :app_name => 'Littlehumans',
                                 :calendar => 'm88eksashs23rt5r00ji2vpn2g@group.calendar.google.com')

      logger.info("roster is *** #{@roster.to_json}")
      logger.info("name_shift is *** #{@roster["name_shift"]}")

      event = cal.create_event do |e|
        e.title = @roster["name_shift"]
        e.where = @roster["name_location_shift"] + ", " + @roster["name_location_hospital"]
        e.start_time = @roster["time_shift_start"]
        e.end_time = @roster["time_shift_end"]
      end

      logger.info("event is *** #{event.to_json}") # display in rails console

      logger.info("cal events is *** #{cal.events.to_json}") # display in rails console

      respond_to do |format|
          format.html { redirect_to user_path(current_user), :notice => 'calendar event created.' }
      end
    end

  end

  # GET /rosters/1
  # GET /rosters/1.json
  def show

    if params[:filter] == "get"
      # obtain parsed Google Calendar API with pre-defined calendar id using key/secret
      @url_resp = ClientGoogle::client_google
      #logger.info("url_httparty response is *** #{@url_resp.to_json}") 
      #binding.pry
      respond_to do |format|
          format.json { render :json => @url_resp.to_json }
          format.html { redirect_to user_path(current_user), :notice => 'httparty response errors.' }
      end
    elsif params[:filter] == "post" #&& params[:new_status] == "create"
      #new_status = params[:new_status]
      # event_id = params[:event_id]
 
      require 'rubygems'
      require 'google_calendar'

      cal = Google::Calendar.new(:username => ENV['G_USER'],
                                 :password => ENV['G_PASS'],
                                 :app_name => 'Littlehumans',
                                 :calendar => 'm88eksashs23rt5r00ji2vpn2g@group.calendar.google.com')


      event = cal.create_event do |e|
        e.title = 'A Cool Event'
        e.start_time = Time.now
        e.end_time = Time.now + (60 * 60) # seconds * min
      end

      # event = cal.find_or_create_event_by_id(event.id) do |e|
      #   e.title = 'An Updated Cool Event'
      #   e.end_time = Time.now + (60 * 60 * 2) # seconds * min * hours
      # end

      # # All events
      # puts cal.events

      # # Query events
      # puts cal.find_events('my search string')

      logger.info("event is *** #{event.to_json}") # display in rails console

      logger.info("cal events is *** #{cal.events.to_json}") # display in rails console

      test = { :hi => "hi" }
      logger.info("test is *** #{test.to_json}") # display in rails console

      respond_to do |format|
          format.json { render :json => event.to_json }
          format.html { redirect_to user_path(current_user), :notice => 'httparty response errors.' }
      end
    else
      params[:filter] == nil
    end
  end

  # GET /rosters/new
  def new
    @roster = current_user.rosters.new
  end

  # GET /rosters/1/edit
  def edit
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
  #Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def roster_params 
    # http://guides.rubyonrails.org/action_controller_overview.html#more-examples
    params.fetch(:roster, {}).permit(:name_shift, :name_location_hospital, :name_location_shift, :time_shift_start, :time_shift_end, :time_shift_duration)
  end
end
