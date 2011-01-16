require 'spec_helper'

describe "rides/show.html.haml" do
  before(:each) do
    @ride = assign(:ride, stub_model(Ride))
  end

  it "renders attributes in <p>" do
    render
  end
end
