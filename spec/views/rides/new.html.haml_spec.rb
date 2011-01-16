require 'spec_helper'

describe "rides/new.html.haml" do
  before(:each) do
    assign(:ride, stub_model(Ride).as_new_record)
  end

  it "renders new ride form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rides_path, :method => "post" do
    end
  end
end
