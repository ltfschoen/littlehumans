class RostersController < ApplicationController
  before_action :set_user, only: [:calendar]

  # GET /rosters
  # GET /rosters.json
  def index
    @rosters = current_user.rosters.all
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
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def roster_params
    params.require(:roster).permit(:name_shift, :name_hospital, :name_location, :time_shift_start, :time_shift_end, :time_shift_duration)
  end
end
