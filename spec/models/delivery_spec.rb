require 'spec_helper'

RSpec.describe Delivery, :type => :model do

  context "associations" do
    it { should belong_to :user }
    it { should belong_to :roster }
  end

end