require 'spec_helper'

describe Delivery do

  context "associations" do
    it { should belong_to :user }
    it { should belong_to :roster }
  end

end