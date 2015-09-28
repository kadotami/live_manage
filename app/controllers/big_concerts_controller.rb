class BigConcertsController < ApplicationController
  before_action :set_big_concert, only: [:show, :edit, :update, :destroy]

  # GET /big_concerts
  # GET /big_concerts.json
  def index
    @big_concerts = BigConcert.order("id DESC").all
    @title = "コン一覧"
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
