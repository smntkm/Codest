require 'spec_helper'

describe UserFilesController do
  before(:each) do
    s = Dir::pwd.to_s + ("/spec/factories/sample_test.rb")
    @f = Rack::Test::UploadedFile.new(s, "text/x-ruby-script")
  end
  let(:valid_attributes) { { data: @f } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all user_files as @user_files" do
      user_file = FactoryGirl.create(:question_file)
      get :index, {}, valid_session
      assigns(:user_files).should eq([user_file])
    end
  end

  describe "GET show" do
    it "assigns the requested user_file as @user_file" do
      user_file = FactoryGirl.create(:question_file)
      get :show, {:id => user_file.to_param}, valid_session
      assigns(:user_file).should eq(user_file)
    end
  end

  describe "GET new" do
    it "assigns a new user_file as @user_file" do
      get :new, {}, valid_session
      assigns(:user_file).should be_a_new(UserFile)
    end
  end

  describe "GET edit" do
    it "assigns the requested user_file as @user_file" do
      user_file = FactoryGirl.create(:question_file)
      get :edit, {:id => user_file.to_param}, valid_session
      assigns(:user_file).should eq(user_file)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new UserFile" do
        expect {
          post :create, {:user_file => valid_attributes }, valid_session 
        }.to change(UserFile, :count).by(1)
      end

      it "assigns a newly created user_file as @user_file" do
        post :create, {:user_file => valid_attributes }, valid_session
        
        assigns(:user_file).should be_a(UserFile)
        assigns(:user_file).should be_persisted
      end

      it "redirects to the created user_file" do
        post :create, {:user_file => valid_attributes }, valid_session
        response.should redirect_to(UserFile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user_file as @user_file" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserFile.any_instance.stub(:save).and_return(false)
        post :create, {:user_file => valid_attributes }, valid_session
        assigns(:user_file).should be_a_new(UserFile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserFile.any_instance.stub(:save).and_return(false)
        post :create, {:user_file => valid_attributes }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user_file" do
        user_file = FactoryGirl.create(:question_file)
        put :update, {:id => user_file.to_param, :user_file => valid_attributes }, valid_session
      end

      it "assigns the requested user_file as @user_file" do
        user_file = FactoryGirl.create(:question_file)
        put :update, {:id => user_file.to_param, :user_file => valid_attributes}, valid_session
        assigns(:user_file).should eq(user_file)
      end

      it "redirects to the user_file" do
        user_file = FactoryGirl.create(:question_file)
        put :update, {:id => user_file.to_param, :user_file => valid_attributes}, valid_session
        response.should redirect_to(user_file)
      end
    end

    describe "with invalid params" do
      it "assigns the user_file as @user_file" do
        user_file = FactoryGirl.create(:question_file)
        # Trigger the behavior that occurs when invalid params are submitted
        UserFile.any_instance.stub(:save).and_return(false)
        put :update, {:id => user_file.to_param, :user_file => valid_attributes }, valid_session
        assigns(:user_file).should eq(user_file)
      end

      it "re-renders the 'edit' template" do
        user_file = FactoryGirl.create(:question_file)
        # Trigger the behavior that occurs when invalid params are submitted
        UserFile.any_instance.stub(:save).and_return(false)
        put :update, {:id => user_file.to_param, :user_file => valid_attributes }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user_file" do
      user_file = FactoryGirl.create(:question_file)
      expect {
        delete :destroy, {:id => user_file.to_param}, valid_session
      }.to change(UserFile, :count).by(-1)
    end

    it "redirects to the user_files list" do
      user_file = FactoryGirl.create(:question_file)
      delete :destroy, {:id => user_file.to_param}, valid_session
      response.should redirect_to(user_files_url)
    end
  end

  describe "GET download" do
    it "ファイルをダウンロード出来る" do
      user_file = FactoryGirl.build(:question_file)
      user_file.save
      get :download, { :id => user_file.to_param }, valid_session
      #response.should  render_template("show")
      #response.should redirect_to(user_file_url(user_file.id))
    end
  end
end
