class BigConcertsController < ApplicationController
  before_action :set_big_concert, only: [:show, :edit, :update, :destroy]

  # GET /big_concerts
  # GET /big_concerts.json
  def index
    @big_concerts = BigConcert.all
    @title = "コン一覧"
  end

  def all
    @big_concerts = BigConcert.all
    @title = "コン一覧"
  end

  # GET /big_concerts/1
  # GET /big_concerts/1.json
  def show
  end

  # GET /big_concerts/new
  def new
    @big_concert = BigConcert.new
  end

  # GET /big_concerts/1/edit
  def edit
  end

  # POST /big_concerts
  # POST /big_concerts.json
  def create
    @big_concert = BigConcert.new(big_concert_params)

    respond_to do |format|
      if @big_concert.save
        format.html { redirect_to @big_concert, notice: 'Big concert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @big_concert }
      else
        format.html { render action: 'new' }
        format.json { render json: @big_concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /big_concerts/1
  # PATCH/PUT /big_concerts/1.json
  def update
    respond_to do |format|
      if @big_concert.update(big_concert_params)
        format.html { redirect_to @big_concert, notice: 'Big concert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @big_concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /big_concerts/1
  # DELETE /big_concerts/1.json
  def destroy
    @big_concert.destroy
    respond_to do |format|
      format.html { redirect_to big_concerts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_big_concert
      @big_concert = BigConcert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def big_concert_params
      params.require(:big_concert).permit(:year, :season, :can_edit)
    end
end
