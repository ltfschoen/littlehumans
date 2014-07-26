require 'httparty'
require 'google_calendar'

class UsersController < ApplicationController
  # allow twitter-text gem to work. also added to helper/application_helper.rb
  include Twitter::Autolink 

  # GET /users/1
  # GET /users/1.json
  def show
    # added filter to have access to array of cancelled events
    @rosters = Roster.where("name_shift IS NOT NULL").select("distinct name_shift").all
    
    @cancelled_array = @rosters.map(&:name_shift)
    #logger.info("cancelled_array response is *** #{@cancelled_array}")
    
    @user = current_user
    
    # access to environment variables holding twitter client key, secret, and tokens
    require './lib/assets/client_twitter'

    # grab twitter key, secret, and tokens from library folder to get tweets 
    @client = ClientTwitter::client_twitter
    
    # get latest 5 tweets from twitter username 'MidwivesACM'
    @tweet = @client.user_timeline("MidwivesACM", { :count => 3, :include_rts => true })
    #binding.pry
    @tweet2 = @client.user_timeline("midwifeorg", { :count => 3, :include_rts => true })
    #logger.info("twitter_user_timeline response is *** #{@tweet2.to_json}") # display in rails console
  end

  def dashboard
    redirect_to user_path(current_user)
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
        format.html { redirect_to @user, :notice => 'user was successfully created.' }
        format.json { render :action => "show", :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end 
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, :notice => "user was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
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
