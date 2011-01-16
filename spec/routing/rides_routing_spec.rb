require "spec_helper"

describe RidesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/rides" }.should route_to(:controller => "rides", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/rides/new" }.should route_to(:controller => "rides", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/rides/1" }.should route_to(:controller => "rides", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/rides/1/edit" }.should route_to(:controller => "rides", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/rides" }.should route_to(:controller => "rides", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/rides/1" }.should route_to(:controller => "rides", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/rides/1" }.should route_to(:controller => "rides", :action => "destroy", :id => "1")
    end

  end
end
