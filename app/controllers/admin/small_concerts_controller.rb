class Admin::SmallConcertsController < AdminController
  before_action :set_small_concert, only: [:show, :edit, :update, :destroy]

  # GET /small_concerts
  # GET /small_concerts.json
  def index
    @small_concerts = SmallConcert.all
    @title = "教室ライブ一覧"
  end

  # GET /small_concerts/1
  # GET /small_concerts/1.json
  def show
  end

  # GET /small_concerts/new
  def new
    @title = "教室ライブ作成"
    @small_concert = SmallConcert.new
  end

  # GET /small_concerts/1/edit
  def edit
  end

  # POST /small_concerts
  # POST /small_concerts.json
  def create
    @small_concert = SmallConcert.new(small_concert_params)

    respond_to do |format|
      if @small_concert.save
        format.html { redirect_to @small_concert, notice: 'Small concert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @small_concert }
      else
        format.html { render action: 'new' }
        format.json { render json: @small_concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /small_concerts/1
  # PATCH/PUT /small_concerts/1.json
  def update
    respond_to do |format|
      if @small_concert.update(small_concert_params)
        format.html { redirect_to @small_concert, notice: 'Small concert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @small_concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /small_concerts/1
  # DELETE /small_concerts/1.json
  def destroy
    @small_concert.destroy
    respond_to do |format|
      format.html { redirect_to small_concerts_url }
      format.json { head :no_content }
    end
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
