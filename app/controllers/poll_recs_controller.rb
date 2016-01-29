require 'json'
class PollRecsController < ApplicationController
  before_action :set_poll_rec, only: [:show, :edit, :update, :destroy]

  # GET /poll_recs
  # GET /poll_recs.json
  def index
    @poll_recs = PollRec.all
  end

  # GET /poll_recs/1
  # GET /poll_recs/1.json
  def show
  end

  # GET /poll_recs/new
  def new
    @poll_rec = PollRec.new
  end

  # GET /poll_recs/1/edit
  def edit
  end

  # POST /poll_recs
  # POST /poll_recs.json
  def create
    @poll_rec = PollRec.new(poll_rec_params)

    respond_to do |format|
      if @poll_rec.save
        format.html { redirect_to @poll_rec, notice: 'Poll rec was successfully created.' }
        format.json { render :show, status: :created, location: @poll_rec }
      else
        format.html { render :new }
        format.json { render json: @poll_rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poll_recs/1
  # PATCH/PUT /poll_recs/1.json
  def update
    respond_to do |format|
      if @poll_rec.update(poll_rec_params)
        format.html { redirect_to @poll_rec, notice: 'Poll rec was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll_rec }
      else
        format.html { render :edit }
        format.json { render json: @poll_rec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_recs/1
  # DELETE /poll_recs/1.json
  def destroy
    @poll_rec.destroy
    respond_to do |format|
      format.html { redirect_to poll_recs_url, notice: 'Poll rec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_count
    n= PollRecRepository.recuentaVotosDEFINITIVO(params[:id])
    @res = n[0]
    @res
    render json: @res
  end

  def show_countCP
    PollRecRepository.recuentaVotosDEFINITIVOconCP(params[:id])
    @res = PollRecRepository.recuentaVotosDEFINITIVOconCPmejorado(params[:id])
    @res
    render json: @res
  end

  def show_countByCP
    @res = PollRecRepository.recuentaVotosDEFINITIVOconCPdeterminado(params[:id], params[:cp])
    @res
    render json: @res
  end

  def show_polls
    @res = PollRecRepository.devuelvePollNamePollId
    @res
    render json: @res
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll_rec
      @poll_rec = PollRec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_rec_params
      params[:poll_rec]
    end
end
