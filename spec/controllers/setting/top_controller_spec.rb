require "spec_helper"

describe Setting::TopController do
  describe "GET index" do
    specify "indexのテンプレートを描画している" do
      get :index
      expect(response).to render_template "index"
    end
  end
end
