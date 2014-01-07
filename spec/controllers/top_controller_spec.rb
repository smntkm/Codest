require "spec_helper"

describe TopController do
  describe "GET index" do
    specify "indexのテンプレートを描画している" do
      get :index
      expect(response).to render_template "index"
    end
  end
end
