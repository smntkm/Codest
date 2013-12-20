require "spec_helper"

describe Setting::QuestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/setting/questions").should route_to("setting/questions#index")
    end

    it "routes to #new" do
      get("/setting/questions/new").should route_to("setting/questions#new")
    end

    it "routes to #show" do
      get("/setting/questions/1").should route_to("setting/questions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/setting/questions/1/edit").should route_to("setting/questions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/setting/questions").should route_to("setting/questions#create")
    end

    it "routes to #update" do
      put("/setting/questions/1").should route_to("setting/questions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/setting/questions/1").should route_to("setting/questions#destroy", :id => "1")
    end
  end
end
