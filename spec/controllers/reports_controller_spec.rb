require 'spec_helper'

describe ReportsController do
  describe "POST create" do
    specify "レポート表示ページが表示される" do
      answer = FactoryGirl.create(:answer)
      post :create, { id: answer }

      response.should render_template("report")
    end

    specify "テスト実行結果の作成" do
      #問題作成
      s = Dir::pwd.to_s + ("/spec/factories/sample_test.rb")
      f = Rack::Test::UploadedFile.new(s, "text/x-ruby-script")
      question_file = UserFile.new
      question_file.send_file(f)
      q = Question.new
      q.user_file = question_file
      q.title = "問題1"
      q.content = "2つの文字列を連結し、返すテストの作成"
      q.save
    
      #解答の作成
      as = Dir::pwd.to_s + ("/spec/factories/sample.rb")
      af = Rack::Test::UploadedFile.new(as, "text/x-ruby-script")
      answer_file = UserFile.new
      answer_file.send_file(af)
      a = Answer.new
      a.user_file = answer_file
      a.user_name = "Mike"
      a.question_id = q.id
      a.email = "hoge@sample.com"
      a.save

      get :create, { id: a }
      result = assigns(:result)

      expect(result.size).to eq 3
      expect(result[0]).to be_true
      expect(result[1]).to eq ""
    end

    specify "解答がDBから削除されている" do
      question_file = FactoryGirl.create(:question_file)
      question = FactoryGirl.create(:question, user_file: question_file)
      question.save
      answer_file = FactoryGirl.create(:answer_file)
      answer = FactoryGirl.create(:answer, user_file: answer_file)
      answer.question = question
      answer.save
      expect {
        get :create, { id: answer }
      }.to change(Answer, :count).by -1
    end
  end
end
