require 'httparty'

class UsersController < ApplicationController
  include Twitter::Autolink # allows twitter-text gem to work. also added to helper/application_helper.rb

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  	@user = current_user

	# get tweets 
	@client = Twitter::REST::Client.new do |config| 
	  config.consumer_key        = ENV['TWITTER_KEY']
	  config.consumer_secret     = ENV['TWITTER_SECRET']
	  config.access_token 		 = ENV['TWITTER_ACCESS_TOKEN']
	  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
	end

    # get latest 5 tweets from twitter username 'MidwivesACM'
	@tweet = @client.user_timeline("MidwivesACM", {:count => 3, :include_rts => true})
 
    #binding.pry
    @tweet2 = @client.user_timeline("midwifeorg", {:count => 3, :include_rts => true})
    logger.info("twitter_user_timeline response is *** #{@tweet2.to_json}") # display in rails console

  end

  def dashboard
  	redirect_to user_path(current_user)
  end

  def calendar
  	google_key = ENV['GOOGLE_KEY'] 
  	google_simple = ENV['GOOGLE_SIMPLE'] # generate at https://code.google.com/apis/console/
  	google_calendarid = 'm88eksashs23rt5r00ji2vpn2g@group.calendar.google.com' # generate from settings in google calendar 

 	if params[:filter] == 'get'

		url = "https://www.googleapis.com/calendar/v3/calendars/#{google_calendarid}/events?key=#{google_simple}&access_token=#{google_key}"

	    @url_resp = HTTParty.get(url) 
	    logger.info("url_httparty response is *** #{@url_resp.to_json}") # display in rails console
	    #binding.pry

	    respond_to do |format|
	        format.json { render json: @url_resp.to_json }
	        format.html { redirect_to user_path(current_user), notice: 'httparty response errors.' }
	    end

  	elsif params[:filter] == 'post' && params[:new_status] == 'cancelled'

	new_status = params[:new_status]
	event_id = params[:event_id]
		#url = "https://www.googleapis.com/calendar/v3/calendars/#{google_calendarid}/events?key=#{google_simple}&access_token=#{google_key}&status=#{new_status}"
		url = "https://www.googleapis.com/calendar/v3/calendars/#{google_calendarid}/events/#{event_id}?key=#{google_simple}&access_token=#{google_key}&status=#{new_status}"

	    @url_resp = HTTParty.post(url).parsed_response
	    logger.info("url_httparty response is *** #{@url_resp.to_json}") # display in rails console
	    #binding.pry

	    respond_to do |format|
	        format.json { render json: @url_resp.to_json }
	        format.html { redirect_to user_path(current_user), notice: 'httparty response errors.' }
	    end

	else

		params[:filter] == nil

    end


  end

  # GET /users/new
  def new
    @user = resource_name.users.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = resource_name.users.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :twitter_login, :provider, :uid, :kind, :image, :name)

    end

end

