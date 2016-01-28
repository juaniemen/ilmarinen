class CountCpsController < ApplicationController
  before_action :set_count_cp, only: [:show, :edit, :update, :destroy]

  # GET /count_cps
  # GET /count_cps.json
  def index
    @count_cps = CountCp.all
  end

  # GET /count_cps/1
  # GET /count_cps/1.json
  def show
  end

  # GET /count_cps/new
  def new
    @count_cp = CountCp.new
  end

  # GET /count_cps/1/edit
  def edit
  end

  # POST /count_cps
  # POST /count_cps.json
  def create
    @count_cp = CountCp.new(count_cp_params)

    respond_to do |format|
      if @count_cp.save
        format.html { redirect_to @count_cp, notice: 'Count cp was successfully created.' }
        format.json { render :show, status: :created, location: @count_cp }
      else
        format.html { render :new }
        format.json { render json: @count_cp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /count_cps/1
  # PATCH/PUT /count_cps/1.json
  def update
    respond_to do |format|
      if @count_cp.update(count_cp_params)
        format.html { redirect_to @count_cp, notice: 'Count cp was successfully updated.' }
        format.json { render :show, status: :ok, location: @count_cp }
      else
        format.html { render :edit }
        format.json { render json: @count_cp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /count_cps/1
  # DELETE /count_cps/1.json
  def destroy
    @count_cp.destroy
    respond_to do |format|
      format.html { redirect_to count_cps_url, notice: 'Count cp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_count_cp
      @count_cp = CountCp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def count_cp_params
      params[:count_cp]
    end
end
