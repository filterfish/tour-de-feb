require 'spec_helper'

describe "preferences/edit.html.erb" do
  before(:each) do
    @preference = assign(:preference, stub_model(Preference))
  end

  it "renders the edit preference form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => preference_path(@preference), :method => "post" do
    end
  end
end
