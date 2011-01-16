require 'spec_helper'

describe "rides/edit.html.haml" do
  before(:each) do
    @ride = assign(:ride, stub_model(Ride))
  end

  it "renders the edit ride form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ride_path(@ride), :method => "post" do
    end
  end
end
