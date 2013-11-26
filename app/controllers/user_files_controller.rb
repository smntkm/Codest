class UserFilesController < ApplicationController
  before_action :set_user_file, only: [:show, :edit, :update, :destroy]

  # GET /user_files
  # GET /user_files.json
  def index
    @user_files = UserFile.all
  end

  # GET /user_files/1
  # GET /user_files/1.json
  def show
  end

  # GET /user_files/new
  def new
    @user_file = UserFile.new
  end

  # GET /user_files/1/edit
  def edit
  end

  # POST /user_files
  # POST /user_files.json
  def create
    @user_file = UserFile.new()

    file = params[:user_file][:data]
     
    @user_file.name = file.original_filename
    @user_file.content_type = file.content_type
    @user_file.data = file.read

    respond_to do |format|
      if @user_file.save
        format.html { redirect_to @user_file, notice: 'Question file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_files/1
  # PATCH/PUT /user_files/1.json
  def update
    @user_file = UserFile.find(params[:id])

    file = params[:user_file][:data]
     
    @user_file.name = file.original_filename
    @user_file.content_type = file.content_type
    @user_file.data = file.read

    respond_to do |format|
      if @user_file.save
        format.html { redirect_to @user_file, notice: 'Question file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_files/1
  # DELETE /user_files/1.json
  def destroy
    @user_file.destroy
    respond_to do |format|
      format.html { redirect_to user_files_url }
      format.json { head :no_content }
    end
  end

  def download
    @user_file = UserFile.find(params[:id])
    send_data(
      @user_file.data,
      filename: @user_file.name,
      content_type: @user_file.content_type
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_file
      @user_file = UserFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_file_params
      params.require(:user_file).permit(:name, :content_type, :data)
    end
end
