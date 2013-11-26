require "spec_helper"

describe UserFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/user_files").should route_to("user_files#index")
    end

    it "routes to #new" do
      get("/user_files/new").should route_to("user_files#new")
    end

    it "routes to #show" do
      get("/user_files/1").should route_to("user_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_files/1/edit").should route_to("user_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_files").should route_to("user_files#create")
    end

    it "routes to #update" do
      put("/user_files/1").should route_to("user_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_files/1").should route_to("user_files#destroy", :id => "1")
    end

    it "routes to #download" do
      get("/user_files/1/download").should route_to("user_files#download", id: "1")

    end
  end
end
