class BigConcertBandsController < ApplicationController
  before_action :set_big_concert_band, only: [:show, :edit, :update, :destroy]

  # GET /big_concert_bands
  # GET /big_concert_bands.json
  def index
    year = params[:year]
    season_param = params[:season]
    season = season_string(season_param.to_i)
    @title = year.to_s + "年" + season + "コン"
    @big_concert_bands = BigConcertBand.where(year: year).where(season: season_param).load
    @can_edit = BigConcert.find(:first, :conditions => ["year = ? and season = ?", year, season_param])

  end

  # GET /big_concert_bands/new
  def new
    last_concert = BigConcert.last
    season = season_string(last_concert.season)
    if !last_concert.can_edit
      render :template => "errors/reject", :status => 404, :layout => 'application', :content_type => 'text/html'
    end
    @title = last_concert.year.to_s + "年" + season + "コン申請"
    @big_concert_band = BigConcertBand.new
  end

  # GET /big_concert_bands/1/edit
  def edit
    @big_concert_band = BigConcertBand.find(params[:id])
  end

  # POST /big_concert_bands
  # POST /big_concert_bands.json
  def create
    @big_concert_band = BigConcertBand.new(big_concert_band_params)
    last_concert = BigConcert.last
    @big_concert_band.year = last_concert.year
    @big_concert_band.season = last_concert.season
    @big_concert_band.user_id = current_user.id
    respond_to do |format|
      if @big_concert_band.save
        format.html { redirect_to '/big_concert_bands/?year='+last_concert.year.to_s+'&season='+last_concert.season.to_s, notice: 'Big concert band was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @big_concert_band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /big_concert_bands/1
  # PATCH/PUT /big_concert_bands/1.json
  def update
    year = @big_concert_band.year
    season = @big_concert_band.season
    can_edit = BigConcert.find(:first, :conditions => ["year = ? and season = ?", year, season])
    if !can_edit.can_edit
      redirect_to '/'
    end
    respond_to do |format|
      if @big_concert_band.update(big_concert_band_params)
        format.html { redirect_to '/big_concert_bands/?year='+year.to_s+'&season='+season.to_s, notice: 'Big concert band was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @big_concert_band.errors, status: :unprocessable_entity }
      end
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
