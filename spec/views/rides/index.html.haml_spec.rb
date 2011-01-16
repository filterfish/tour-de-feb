require 'spec_helper'

describe "rides/index.html.haml" do
  before(:each) do
    assign(:rides, [
      stub_model(Ride),
      stub_model(Ride)
    ])
  end

  it "renders a list of rides" do
    render
  end
end
