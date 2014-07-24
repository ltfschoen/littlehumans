require 'spec_helper'

describe User do

  context "associations" do
    it { should have_many :rosters }
    it { should have_many :deliveries }
  end

end