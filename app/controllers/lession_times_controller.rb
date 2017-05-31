class LessionTimesController < ApplicationController
  def create
    @lession_time = LessionTime.new(lession_time_params)

    respond_to do |format|
      format.js { render :create, status: :created }
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def new
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def lession_time_params
    params.require(:lession_time).permit(:day, :start_at, :end_at)
  end
end
