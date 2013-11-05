class QuestionFilesController < ApplicationController
  before_action :set_question_file, only: [:show, :edit, :update, :destroy]

  # GET /question_files
  # GET /question_files.json
  def index
    @question_files = QuestionFile.all
  end

  # GET /question_files/1
  # GET /question_files/1.json
  def show
  end

  # GET /question_files/new
  def new
    @question_file = QuestionFile.new
  end

  # GET /question_files/1/edit
  def edit
  end

  # POST /question_files
  # POST /question_files.json
  def create
    @question_file = QuestionFile.new()

    file = params[:question_file][:data]
     
    @question_file.name = file.original_filename
    @question_file.content_type = file.content_type
    @question_file.data = file.read

    respond_to do |format|
      if @question_file.save
        format.html { redirect_to @question_file, notice: 'Question file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @question_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_files/1
  # PATCH/PUT /question_files/1.json
  def update
    @question_file = QuestionFile.find(params[:id])

    file = params[:question_file][:data]
     
    @question_file.name = file.original_filename
    @question_file.content_type = file.content_type
    @question_file.data = file.read

    respond_to do |format|
      if @question_file.save
        format.html { redirect_to @question_file, notice: 'Question file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_files/1
  # DELETE /question_files/1.json
  def destroy
    @question_file.destroy
    respond_to do |format|
      format.html { redirect_to question_files_url }
      format.json { head :no_content }
    end
  end

  def download
    @question_file = QuestionFile.find(params[:id])
    send_data(
      @question_file.data,
      filename: @question_file.name,
      content_type: @question_file.content_type
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_file
      @question_file = QuestionFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_file_params
      params.require(:question_file).permit(:name, :content_type, :data)
    end
end
