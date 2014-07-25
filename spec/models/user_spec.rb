require 'spec_helper'

RSpec.describe User, :type => :model do

  context "associations" do
    it { should have_many :rosters }
    it { should have_many :deliveries }
  end

end