require 'spec_helper'

describe Roster do

  context "associations" do
    it { should belong_to :user }
    it { should have_many :deliveries }
  end

end