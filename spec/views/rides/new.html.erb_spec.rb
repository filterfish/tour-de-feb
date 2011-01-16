require 'spec_helper'

describe "rides/new.html.erb" do
  before(:each) do
    assign(:ride, stub_model(Ride,
      :length => 1,
      :time => 1
    ).as_new_record)
  end

  it "renders new ride form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rides_path, :method => "post" do
      assert_select "input#ride_length", :name => "ride[length]"
      assert_select "input#ride_time", :name => "ride[time]"
    end
  end
end
