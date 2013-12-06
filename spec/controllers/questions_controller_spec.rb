require 'spec_helper'

describe QuestionsController do
  before(:each) do
    s = Dir::pwd.to_s + ("/spec/factories/sample_test.rb")
    @f = Rack::Test::UploadedFile.new(s, "text/x-ruby-script")

  end
  let(:user_file_valid_attributes) { { data: @f }}

  let(:valid_attributes) { { "title" => "MyTitile", "content" => "MyContent" , "user_file_attributes" => user_file_valid_attributes} }

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
        response.should redirect_to(Question.last)
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
      response.should redirect_to(questions_url)
    end
  end
end
