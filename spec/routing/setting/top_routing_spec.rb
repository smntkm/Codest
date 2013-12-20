require "spec_helper"

describe Setting::TopController do
  describe "routing" do
    specify "routes to #index" do
      get("/setting/top").should route_to("setting/top#index")
    end
  end
end
