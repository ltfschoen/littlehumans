require 'spec_helper'

RSpec.describe UsersController, :type => :controller do

  # # Does not pass test. Gives error "undefined method `sign_in_as_a_valid_user' for ValidUserRequestHelper:Module"
  # # Runs before each test.
  # before do
  #     # Sign in as a user.
  #     sign_in_as_a_valid_user
  # end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end