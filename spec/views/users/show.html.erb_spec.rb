require 'spec_helper'

RSpec.describe "users/show.html.erb", :type => :view do
  it "displays twitter details correctly" do
    assign(:event, Event.new(:location => "Chicago"))
    render
    expect(rendered).to include("Tweet")
  end
end