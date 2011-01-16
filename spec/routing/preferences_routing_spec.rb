require "spec_helper"

describe PreferencesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/preferences" }.should route_to(:controller => "preferences", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/preferences/new" }.should route_to(:controller => "preferences", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/preferences/1" }.should route_to(:controller => "preferences", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/preferences/1/edit" }.should route_to(:controller => "preferences", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/preferences" }.should route_to(:controller => "preferences", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/preferences/1" }.should route_to(:controller => "preferences", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/preferences/1" }.should route_to(:controller => "preferences", :action => "destroy", :id => "1")
    end

  end
end
