require 'spec_helper'

describe "preferences/show.html.erb" do
  before(:each) do
    @preference = assign(:preference, stub_model(Preference))
  end

  it "renders attributes in <p>" do
    render
  end
end
