require "spec_helper"

describe QuestionFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/question_files").should route_to("question_files#index")
    end

    it "routes to #new" do
      get("/question_files/new").should route_to("question_files#new")
    end

    it "routes to #show" do
      get("/question_files/1").should route_to("question_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/question_files/1/edit").should route_to("question_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/question_files").should route_to("question_files#create")
    end

    it "routes to #update" do
      put("/question_files/1").should route_to("question_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/question_files/1").should route_to("question_files#destroy", :id => "1")
    end

  end
end
