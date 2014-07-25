require 'spec_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET #about_us" do
    it "responds successfully with an HTTP 200 status code" do
      get :about_us
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #contact_us" do
    it "responds successfully with an HTTP 200 status code" do
      get :contact_us
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #privacy" do
    it "responds successfully with an HTTP 200 status code" do
      get :privacy
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #terms_and_cond" do
    it "responds successfully with an HTTP 200 status code" do
      get :terms_and_cond
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #help" do
    it "responds successfully with an HTTP 200 status code" do
      get :help
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end