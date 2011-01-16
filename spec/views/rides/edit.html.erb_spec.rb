require 'spec_helper'

describe "rides/edit.html.erb" do
  before(:each) do
    @ride = assign(:ride, stub_model(Ride,
      :length => 1,
      :time => 1
    ))
  end

  it "renders the edit ride form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ride_path(@ride), :method => "post" do
      assert_select "input#ride_length", :name => "ride[length]"
      assert_select "input#ride_time", :name => "ride[time]"
    end
  end
end
