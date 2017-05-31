class AvailibleTimesController < ApplicationController
  before_action :set_availible_time, only: [:show, :edit, :update, :destroy]
  before_action :set_teacher
  layout 'teacher'

  # GET /availible_times
  # GET /availible_times.json
  def index
    @availible_times = @teacher.availible_times.order('day').all
  end

  # GET /availible_times/1
  # GET /availible_times/1.json
  def show
  end

  # GET /availible_times/new
  def new
    @availible_time = AvailibleTime.new
  end

  # GET /availible_times/1/edit
  def edit
  end

  # POST /availible_times
  # POST /availible_times.json
  def create
    @availible_time = AvailibleTime.new(availible_time_params)

    respond_to do |format|
      if @availible_time.save
        format.html { redirect_to teacher_availible_times_path(@teacher), notice: 'Availible time was successfully created.' }
        format.json { render :show, status: :created, location: @availible_time }
      else
        format.html { render :index }
        format.json { render json: @availible_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availible_times/1
  # PATCH/PUT /availible_times/1.json
  def update
    respond_to do |format|
      if @availible_time.update(availible_time_params)
        format.html { redirect_to @availible_time, notice: 'Availible time was successfully updated.' }
        format.json { render :show, status: :ok, location: @availible_time }
      else
        format.html { render :edit }
        format.json { render json: @availible_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availible_times/1
  # DELETE /availible_times/1.json
  def destroy
    @availible_time.destroy
    respond_to do |format|
      format.html { redirect_to teacher_availible_times_path(@teacher), notice: 'Availible time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:teacher_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_availible_time
      @availible_time = AvailibleTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availible_time_params
      params.require(:availible_time).permit(:day, :start_at, :end_at, :teacher_id)
    end
end
