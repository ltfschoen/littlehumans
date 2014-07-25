require 'spec_helper'

RSpec.describe RostersController, :type => :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      get :edit
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  # redirects to devise sign in page for roster creation
  describe "POST #create" do
    subject { post :create, :roster => { :name_shift => "Luke Schoen" } }
    it "redirects to /users/sign_in for user not signed in" do
      subject.should redirect_to("/users/sign_in")
    end
  end

  describe "PATCH/PUT #update" do
    it "responds successfully with an HTTP 200 status code" do
      get :update
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 200 status code" do
      get :destroy
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end