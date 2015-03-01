class TestfilesController < ApplicationController
  before_action :set_testfile, only: [:show, :edit, :update, :destroy]

  # GET /testfiles
  # GET /testfiles.json
  def index
    @testfiles = Testfile.all
  end

  # GET /testfiles/1
  # GET /testfiles/1.json
  def show
  end

  # GET /testfiles/new
  def new
    @testfile = Testfile.new
  end

  # GET /testfiles/1/edit
  def edit
  end

  # POST /testfiles
  # POST /testfiles.json
  def create
    @testfile = Testfile.new(testfile_params)

    respond_to do |format|
      if @testfile.save
        format.html { redirect_to @testfile, notice: 'Testfile was successfully created.' }
        format.json { render :show, status: :created, location: @testfile }
      else
        format.html { render :new }
        format.json { render json: @testfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testfiles/1
  # PATCH/PUT /testfiles/1.json
  def update
    respond_to do |format|
      if @testfile.update(testfile_params)
        format.html { redirect_to @testfile, notice: 'Testfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @testfile }
      else
        format.html { render :edit }
        format.json { render json: @testfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testfiles/1
  # DELETE /testfiles/1.json
  def destroy
    @testfile.destroy
    respond_to do |format|
      format.html { redirect_to testfiles_url, notice: 'Testfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testfile
      @testfile = Testfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testfile_params
      params.require(:testfile).permit(:filename, :content_type, :file_contents, :confidence_rank)
    end
end
