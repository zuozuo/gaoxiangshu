class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update]

  layout 'teacher', only: [:show, :courses]

  def index
    @teachers = Teacher.all.order('id desc')
  end

  def courses
    @teacher = Teacher.find(params[:teacher_id])
    @courses = @teacher.courses
  end

  def show
    params[:lession_status] ||= 'uncompleted'
    if ['uncompleted', "completed"].include?(params[:lession_status])
      @lessions = @teacher
        .lessions
        .order('start_at')
        .includes(:student, :course)
        .send(params[:lession_status])
    else
      @lessions = []
    end
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  private

    def teacher_params
      params.require(:teacher).permit(
        :name, :email, :phone, :age, :gender, :avatar, :school, :school_type, :grade, :time_zone, :time_difference
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
  
end
