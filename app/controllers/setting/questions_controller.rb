require 'bcrypt'

class Setting::QuestionsController < ApplicationController
  include IllegalMethod
  before_action :set_question, only: [:show, :edit, :update, :destroy, :same_password]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.build_user_file
  end

  # GET /questions/1/edit
  def edit
    @question.build_user_file
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if !illegal_question?(@question.user_file.data) && @question.save
        format.html { redirect_to [:setting, @question], notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /questions/1/same_password
  def same_password
    respond_to do |format|
      if @question.same_password? params[:password]
        @question.destroy
        format.html { redirect_to setting_questions_url }
      else
        format.html { render "show", location: @question }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to setting_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content, :password, :email, :user_file_attributes => [:data])
    end
end
