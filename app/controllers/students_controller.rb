class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]

  def index
  end

  def show
    params[:course_status] ||= 'uncompleted'
    if ['uncompleted', "completed"].include?(params[:course_status])
      @courses = @student.courses.order('date').includes(:teacher).send(params[:course_status])
    else
      @courses = []
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  private

    def student_params
      params.require(:student).permit(
        :name, :email, :phone, :age, :gender, :avatar, :school, :school_type, :grade
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
  
end
