require "rails_helper"

RSpec.describe ProvincesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/provinces").to route_to("provinces#index")
    end

    it "routes to #new" do
      expect(:get => "/provinces/new").to route_to("provinces#new")
    end

    it "routes to #show" do
      expect(:get => "/provinces/1").to route_to("provinces#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/provinces/1/edit").to route_to("provinces#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/provinces").to route_to("provinces#create")
    end

    it "routes to #update" do
      expect(:put => "/provinces/1").to route_to("provinces#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/provinces/1").to route_to("provinces#destroy", :id => "1")
    end

  end
end
