require 'spec_helper'

describe ReportsController do
  describe "POST create" do
    specify "レポート表示ページが表示される" do
      answer = FactoryGirl.create(:answer)
      post :create, { answer: answer }

      response.should render_template("report")
    end
  end

end
