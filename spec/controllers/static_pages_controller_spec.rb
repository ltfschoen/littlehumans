require 'spec_helper'

describe StaticPagesController do

  context 'about_us' do
    it 'loads page' do
      response.should be_success
    end
  end

  context 'contact_us' do
    it 'loads page' do
      response.should be_success
    end
  end

  context 'privacy' do
    it 'loads page' do
      response.should be_success
    end
  end

  context 'terms_and_cond' do
    it 'loads page' do
      response.should be_success
    end
  end

  context 'help' do
    it 'loads page' do
      response.should be_success
    end
  end

end