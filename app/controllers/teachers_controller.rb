class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update]

  def show
    params[:course_status] ||= 'uncompleted'
    if ['uncompleted', "completed"].include?(params[:course_status])
      @courses = @teacher.courses.order('date').includes(:student).send(params[:course_status])
    else
      @courses = []
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
        :name, :email, :phone, :age, :gender, :avatar, :school, :school_type, :grade
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
  
end
