require 'spec_helper'

describe "rides/show.html.erb" do
  before(:each) do
    @ride = assign(:ride, stub_model(Ride,
      :length => 1,
      :time => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
