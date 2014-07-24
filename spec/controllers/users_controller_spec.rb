require 'spec_helper'

describe UsersController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  # let(:valid_attributes) { { number: 1, origin: "Sydney", destination: "Melbourne", departure_date: Time.now, arrival_date: Time.now } }

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

end

