class LessionsController < ApplicationController
  before_action :set_lession, only: [:show, :edit, :update, :destroy]

  # GET /lessions
  # GET /lessions.json
  def index
    @lessions = Lession.all
  end

  # GET /lessions/1
  # GET /lessions/1.json
  def show
  end

  # GET /lessions/new
  def new
    @lession = Lession.new
  end

  # GET /lessions/1/edit
  def edit
  end

  # POST /lessions
  # POST /lessions.json
  def create
    @lession = Lession.new(lession_params)

    respond_to do |format|
      if @lession.save
        format.html { redirect_to @lession, notice: 'Lession was successfully created.' }
        format.json { render :show, status: :created, location: @lession }
      else
        format.html { render :new }
        format.json { render json: @lession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessions/1
  # PATCH/PUT /lessions/1.json
  def update
    respond_to do |format|
      if @lession.update(lession_params)
        format.html { redirect_to @lession, notice: 'Lession was successfully updated.' }
        format.json { render :show, status: :ok, location: @lession }
      else
        format.html { render :edit }
        format.json { render json: @lession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessions/1
  # DELETE /lessions/1.json
  def destroy
    @lession.destroy
    respond_to do |format|
      format.html { redirect_to lessions_url, notice: 'Lession was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lession
      @lession = Lession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lession_params
      params.require(:lession).permit(:course_id, :student_id, :teacher_id, :start_at, :status)
    end
end
