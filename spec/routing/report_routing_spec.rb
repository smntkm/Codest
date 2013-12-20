require "spec_helper"

describe ReportsController do
  describe "routing" do
    it "routes to #create" do
      get("/reports/1").should route_to("reports#create", id: "1")
    end
  end
end
