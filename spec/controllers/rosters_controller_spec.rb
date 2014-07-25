require 'spec_helper'

RSpec.describe RostersController, :type => :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      subject { get :index, :roster => { :name_shift => "Luke Schoen" } }
      expect(response).to be_success
      # expect(response).to eq(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      subject { get :show, :roster => { :name_shift => "Luke Schoen" } }
      expect(response).to be_success
      # expect(response).to eq(200)
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      subject { get :new, :roster => { :name_shift => "Luke Schoen" } }
      expect(response).to be_success
      # expect(response).to eq(200)
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      subject { get :edit, :roster => { :name_shift => "Luke Schoen" } }
      expect(response).to be_success
      # expect(response).to eq(200)
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
      subject { get :update, :roster => { :name_shift => "Luke Schoen" } }
      expect(response).to be_success
      # expect(response).to eq(200)
    end
  end
  
  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 200 status code" do
      subject { delete :destroy, :roster => { :name_shift => "Luke Schoen" } }
      expect(response).to be_success
      # expect(response).to eq(200)
    end
  end

end

