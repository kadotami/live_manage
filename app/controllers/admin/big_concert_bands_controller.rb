class Admin::BigConcertBandsController < AdminController
  before_action :set_big_concert_band, only: [:show, :edit, :update, :destroy]

  # GET /big_concert_bands
  # GET /big_concert_bands.json
  def index
    @big_concert_bands = BigConcertBand.all
  end

  def list
    year = params[:year]
    season_param = params[:season]
    if season_param.to_i == 0
      season = '春'
    elsif season_param.to_i == 1
      season = '夏'
    elsif season_param.to_i == 2
      season = '秋'
    end
    @title = year.to_s + "年" + season + "コン"
    @big_concert_bands = BigConcertBand.where(year: year)
                                          .where(season: season_param).load
  end

  # GET /big_concert_bands/1
  # GET /big_concert_bands/1.json
  def show
  end

  # GET /big_concert_bands/new
  def new
    last_concert = BigConcert.last
    if last_concert.season == 0
      season = '春'
    elsif last_concert.season == 1
      season = '夏'
    elsif last_concert.season == 2
      season = '秋'
    end
    @title = last_concert.year.to_s + "年" + season + "コン申請"
    @big_concert_band = BigConcertBand.new
  end

  # GET /big_concert_bands/1/edit
  def edit
  end

  # POST /big_concert_bands
  # POST /big_concert_bands.json
  def create
    @big_concert_band = BigConcertBand.new(big_concert_band_params)
    last_concert = BigConcert.last
    @big_concert_band.year = last_concert.year
    @big_concert_band.season = last_concert.season
    respond_to do |format|
      if @big_concert_band.save
        format.html { redirect_to @big_concert_band, notice: 'Big concert band was successfully created.' }
        format.json { render action: 'show', status: :created, location: @big_concert_band }
      else
        format.html { render action: 'new' }
        format.json { render json: @big_concert_band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /big_concert_bands/1
  # PATCH/PUT /big_concert_bands/1.json
  def update
    respond_to do |format|
      if @big_concert_band.update(big_concert_band_params)
        format.html { redirect_to @big_concert_band, notice: 'Big concert band was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @big_concert_band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /big_concert_bands/1
  # DELETE /big_concert_bands/1.json
  def destroy
    @big_concert_band.destroy
    respond_to do |format|
      format.html { redirect_to big_concert_bands_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_big_concert_band
      @big_concert_band = BigConcertBand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def big_concert_band_params
      params.require(:big_concert_band).permit(:name, :leader, :vo, :gt1, :gt2, :ba, :dr, :key, :day1, :day2, :day3, :day4, :description, :year, :season)
    end
end
