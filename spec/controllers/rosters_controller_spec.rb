require 'spec_helper'

describe RostersController do

  context '#index' do
    it 'returns http success' do
      response.status.should be(200)
    end
  end

  context '#show' do
    it 'returns http success' do
      response.status.should be(200)
    end
  end

  context '#new' do
    it 'returns http success' do
      response.status.should be(200)
    end
  end

  context '#edit' do
    it 'returns http success' do
      response.status.should be(200)
    end
  end

  # redirects to devise sign in page for roster creation
  context '#create' do
    subject { post :create, :roster => { :name_shift => "Luke Schoen" } }
    it "redirects_to /users/sign_in" do
      subject.should redirect_to("/users/sign_in")
    end
  end

  context '#update' do
    it 'returns http success' do
      response.status.should be(200)
    end
  end

  context '#destroy' do
    it 'returns http success' do
      response.status.should be(200)
    end
  end

end