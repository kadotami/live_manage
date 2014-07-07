class Admin::SmallConcertBandsController < AdminController
  before_action :set_small_concert_band, only: [:show, :edit, :update, :destroy]

  # GET /small_concert_bands
  # GET /small_concert_bands.json
  def index
    year = params[:year]
    month = params[:month]
    @title = year.to_s + "年" + month.to_s + "月教室"
    @small_concert_bands = SmallConcertBand.where(year: year)
                                          .where(month: month).load
  end

  # GET /small_concert_bands/1/edit
  def edit
  end

  # PATCH/PUT /small_concert_bands/1
  # PATCH/PUT /small_concert_bands/1.json
  def update
    respond_to do |format|
      if @small_concert_band.update(small_concert_band_params)
        format.html { redirect_to '/admin/small_concert_bands?year='+@small_concert_band.year.to_s+'&month='+@small_concert_band.month.to_s, notice: 'Small concert band was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @small_concert_band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /small_concert_bands/1
  # DELETE /small_concert_bands/1.json
  def destroy
    @small_concert_band.destroy
    respond_to do |format|
      format.html { redirect_to small_concert_bands_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_small_concert_band
      @small_concert_band = SmallConcertBand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def small_concert_band_params
      params.require(:small_concert_band).permit(:name, :song, :leader, :vo, :gt1, :gt2, :ba, :dr, :key, :week1, :week2, :description, :year, :month)
    end
end
