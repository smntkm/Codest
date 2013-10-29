require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe QuestionFilesController do

  # This should return the minimal set of attributes required to create a valid
  # QuestionFile. As you add validations to QuestionFile, be sure to
  # adjust the attributes here as well.
  
  before(:each) do
    s = Dir::pwd.to_s + ("/spec/factories/test.rb")
    @f = Rack::Test::UploadedFile.new(s, "text/x-ruby-script")
  end
  let(:valid_attributes) { { data: @f } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QuestionFilesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all question_files as @question_files" do
      question_file = FactoryGirl.create(:question_file)
      get :index, {}, valid_session
      assigns(:question_files).should eq([question_file])
    end
  end

  describe "GET show" do
    it "assigns the requested question_file as @question_file" do
      question_file = FactoryGirl.create(:question_file)
      get :show, {:id => question_file.to_param}, valid_session
      assigns(:question_file).should eq(question_file)
    end
  end

  describe "GET new" do
    it "assigns a new question_file as @question_file" do
      get :new, {}, valid_session
      assigns(:question_file).should be_a_new(QuestionFile)
    end
  end

  describe "GET edit" do
    it "assigns the requested question_file as @question_file" do
      question_file = FactoryGirl.create(:question_file)
      get :edit, {:id => question_file.to_param}, valid_session
      assigns(:question_file).should eq(question_file)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new QuestionFile" do
        expect {
          post :create, {:question_file => valid_attributes }, valid_session 
        }.to change(QuestionFile, :count).by(1)
      end

      it "assigns a newly created question_file as @question_file" do
        post :create, {:question_file => valid_attributes }, valid_session
        
        assigns(:question_file).should be_a(QuestionFile)
        assigns(:question_file).should be_persisted
      end

      it "redirects to the created question_file" do
        post :create, {:question_file => valid_attributes }, valid_session
        response.should redirect_to(QuestionFile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved question_file as @question_file" do
        # Trigger the behavior that occurs when invalid params are submitted
        QuestionFile.any_instance.stub(:save).and_return(false)
        post :create, {:question_file => valid_attributes }, valid_session
        assigns(:question_file).should be_a_new(QuestionFile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        QuestionFile.any_instance.stub(:save).and_return(false)
        post :create, {:question_file => valid_attributes }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested question_file" do
        question_file = FactoryGirl.create(:question_file)
        # Assuming there are no other question_files in the database, this
        # specifies that the QuestionFile created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        #QuestionFile.any_instance.should_receive(:save).with({ "name" => "test.rb" })
        put :update, {:id => question_file.to_param, :question_file => valid_attributes }, valid_session
      end

      it "assigns the requested question_file as @question_file" do
        question_file = FactoryGirl.create(:question_file)
        put :update, {:id => question_file.to_param, :question_file => valid_attributes}, valid_session
        assigns(:question_file).should eq(question_file)
      end

      it "redirects to the question_file" do
        question_file = FactoryGirl.create(:question_file)
        put :update, {:id => question_file.to_param, :question_file => valid_attributes}, valid_session
        response.should redirect_to(question_file)
      end
    end

    describe "with invalid params" do
      it "assigns the question_file as @question_file" do
        question_file = FactoryGirl.create(:question_file)
        # Trigger the behavior that occurs when invalid params are submitted
        QuestionFile.any_instance.stub(:save).and_return(false)
        put :update, {:id => question_file.to_param, :question_file => valid_attributes }, valid_session
        assigns(:question_file).should eq(question_file)
      end

      it "re-renders the 'edit' template" do
        question_file = FactoryGirl.create(:question_file)
        # Trigger the behavior that occurs when invalid params are submitted
        QuestionFile.any_instance.stub(:save).and_return(false)
        put :update, {:id => question_file.to_param, :question_file => valid_attributes }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested question_file" do
      question_file = FactoryGirl.create(:question_file)
      expect {
        delete :destroy, {:id => question_file.to_param}, valid_session
      }.to change(QuestionFile, :count).by(-1)
    end

    it "redirects to the question_files list" do
      question_file = FactoryGirl.create(:question_file)
      delete :destroy, {:id => question_file.to_param}, valid_session
      response.should redirect_to(question_files_url)
    end
  end
end
