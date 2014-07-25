require 'spec_helper'

RSpec.describe Roster, :type => :model do

  context "associations" do
    it { should belong_to :user }
    it { should have_many :deliveries }
  end

end