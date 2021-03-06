require 'spec_helper'

describe Setting::QuestionsController do
  before(:each) do
    s = Dir::pwd.to_s + ("/spec/factories/sample_test.rb")
    @f = Rack::Test::UploadedFile.new(s, "text/x-ruby-script")

  end
  let(:user_file_valid_attributes) { { data: @f }}

  let(:valid_attributes) { { "title" => "MyTitile", "password" => "password", "email" => "hoge@hoge.com", "content" => "MyContent" , "user_file_attributes" => user_file_valid_attributes} }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all questions as @questions" do
      question = Question.create! valid_attributes
      get :index, {}, valid_session
      assigns(:questions).should eq([question])
    end
  end

  describe "GET show" do
    it "assigns the requested question as @question" do
      question = Question.create! valid_attributes
      get :show, {:id => question.to_param}, valid_session
      assigns(:question).should eq(question)
    end
  end

  describe "GET new" do
    it "assigns a new question as @question" do
      get :new, {}, valid_session
      assigns(:question).should be_a_new(Question)
    end
  end

  describe "GET edit" do
    it "assigns the requested question as @question" do
      question = FactoryGirl.create(:question)
      get :edit, {:id => question.to_param}, valid_session
      assigns(:question).should eq(question)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Question" do
        get :new, {}, valid_session

        expect {
          post :create, {:question => valid_attributes}, valid_session
        }.to change(Question, :count).by(1)
        
        q = Question.all.first
        q.user_file.question.id.should eq q.id
      end

      it "assigns a newly created question as @question" do
        post :create, {:question => valid_attributes}, valid_session
        assigns(:question).should be_a(Question)
        assigns(:question).should be_persisted
      end

      it "redirects to the created question" do
        post :create, {:question => valid_attributes}, valid_session
        response.should redirect_to([:setting, Question.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        Question.any_instance.stub(:save).and_return(false)
        post :create, {:question => { "title" => "invalid value" }}, valid_session
        assigns(:question).should be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        Question.any_instance.stub(:save).and_return(false)
        post :create, {:question => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end

      specify "添付ファイルの内容が不正だと、newに戻る" do
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested question" do
        question = Question.create! valid_attributes
        Question.any_instance.should_receive(:update).with({ "title" => "MyString2" })
        put :update, {:id => question.to_param, :question => { "title" => "MyString2" }}
      end

      it "assigns the requested question as @question" do
        question = Question.create! valid_attributes
        put :update, {:id => question.to_param, :question => valid_attributes}, valid_session
        assigns(:question).should eq(question)
      end

      it "redirects to the question" do
        question = FactoryGirl.create(:question)

        get :edit, {:id => question.to_param}
        assigns(:question).should eq(question)
        
        put :update, {:id => question.to_param, :question => valid_attributes}
        response.should redirect_to(question)
      end
    end

    describe "with invalid params" do
      it "assigns the question as @question" do
        question = Question.create! valid_attributes
        Question.any_instance.stub(:save).and_return(false)
        put :update, {:id => question.to_param, :question => { "title" => "invalid value" }}, valid_session
        assigns(:question).should eq(question)
      end

      it "re-renders the 'edit' template" do
        question = Question.create! valid_attributes
        Question.any_instance.stub(:save).and_return(false)
        put :update, {:id => question.to_param, :question => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "POST same_password" do
    let(:question) { FactoryGirl.create(:question, password: "password") }

    specify "パスワードが一致したとき、settingの一覧画面にリダイレクトされる" do
      post :same_password, { id: question.to_param, password: "password" }

      expect(response).to redirect_to setting_questions_path
    end

    specify "パスワードが一致したとき、問題が削除出来る" do
      expect {
        question #letの遅延評価でcreateが実行されないため、questionを使い登録をしておく
        post :same_password, { id: question.to_param, password: "password" }
      }.to change(Question, :count).by(0)
    end


    specify "パスワードが一致しないとき、show画面に戻る" do
      post :same_password, { id: question.to_param, password: "hogehoge", mathod: :delete }

      expect(response).to render_template "show"
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested question" do
      question = Question.create! valid_attributes
      expect {
        delete :destroy, {:id => question.to_param}, valid_session
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      question = Question.create! valid_attributes
      delete :destroy, {:id => question.to_param}, valid_session
      response.should redirect_to(setting_questions_url)
    end
  end
end
