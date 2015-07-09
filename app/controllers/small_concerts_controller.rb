class SmallConcertsController < ApplicationController
  before_action :set_small_concert, only: [:show, :edit, :update, :destroy]

  # GET /small_concerts
  # GET /small_concerts.json
  def index
    @small_concerts = SmallConcert.all.order("id DESC")
    @title = "教室ライブ一覧"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_small_concert
      @small_concert = SmallConcert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def small_concert_params
      params.require(:small_concert).permit(:year, :month, :can_edit)
    end
end
