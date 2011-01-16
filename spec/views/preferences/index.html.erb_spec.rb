require 'spec_helper'

describe "preferences/index.html.erb" do
  before(:each) do
    assign(:preferences, [
      stub_model(Preference),
      stub_model(Preference)
    ])
  end

  it "renders a list of preferences" do
    render
  end
end
