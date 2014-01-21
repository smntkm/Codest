require 'spec_helper'

describe ReportsController do
  let(:question) { FactoryGirl.create(:question) }
  let(:data) do
    as = Dir::pwd.to_s + ("/spec/factories/sample.rb")
    Rack::Test::UploadedFile.new(as, "text/x-ruby-script")
  end
  let(:valid_attributes) { { question_id: question.id, data: data } }


  describe "Get new" do
    specify "フォーム画面に移動出来る" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    specify "レポート表示ページが表示される" do
      question = FactoryGirl.create(:question)
      post :create, valid_attributes

      response.should render_template("report")
    end

    specify "テスト実行結果の作成" do
      post :create, valid_attributes
      result = assigns(:result)

      expect(result.size).to eq 3
      expect(result[0]).to be_true
      expect(result[1]).to eq ""
    end

    specify "英語の部分がが日本語に成っている" do
      post :create, valid_attributes

      result =  assigns(:result)
      expect(result[0]).to include "失敗"
      expect(result[0]).to include "テスト"
      expect(result[0]).to include "アサーション"
      expect(result[0]).to include "エラー"
      expect(result[0]).to include "スキップ"
    end
  end
end
