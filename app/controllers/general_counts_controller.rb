class GeneralCountsController < ApplicationController
  before_action :set_general_count, only: [:show, :edit, :update, :destroy]

  # GET /general_counts
  # GET /general_counts.json
  def index
    @general_counts = GeneralCount.all
  end

  # GET /general_counts/1
  # GET /general_counts/1.json
  def show
  end

  # GET /general_counts/new
  def new
    @general_count = GeneralCount.new
  end

  # GET /general_counts/1/edit
  def edit
  end

  # POST /general_counts
  # POST /general_counts.json
  def create
    @general_count = GeneralCount.new(general_count_params)

    respond_to do |format|
      if @general_count.save
        format.html { redirect_to @general_count, notice: 'General count was successfully created.' }
        format.json { render :show, status: :created, location: @general_count }
      else
        format.html { render :new }
        format.json { render json: @general_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_counts/1
  # PATCH/PUT /general_counts/1.json
  def update
    respond_to do |format|
      if @general_count.update(general_count_params)
        format.html { redirect_to @general_count, notice: 'General count was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_count }
      else
        format.html { render :edit }
        format.json { render json: @general_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_counts/1
  # DELETE /general_counts/1.json
  def destroy
    @general_count.destroy
    respond_to do |format|
      format.html { redirect_to general_counts_url, notice: 'General count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_count
      @general_count = GeneralCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_count_params
      params[:general_count]
    end
end
