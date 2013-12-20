require "spec_helper"

describe TopController do
  describe "routing" do
    it "routes to #root" do
      get("/").should route_to("top#index")
    end
  end
end
