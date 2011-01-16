require 'spec_helper'

describe "preferences/new.html.erb" do
  before(:each) do
    assign(:preference, stub_model(Preference).as_new_record)
  end

  it "renders new preference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => preferences_path, :method => "post" do
    end
  end
end
