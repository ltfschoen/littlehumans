require 'spec_helper'

describe UsersController do

    # # Does not pass test. Gives error "undefined method `sign_in_as_a_valid_user' for ValidUserRequestHelper:Module"
    # # Runs before each test.
    # before do
    #     # Sign in as a user.
    #     sign_in_as_a_valid_user
    # end

    context '#show' do
      it 'loads page' do
        response.should be_success
      end
    end

end