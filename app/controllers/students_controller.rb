class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  layout 'student', only: [:show, :courses]

  def new
    @student = current_user.students.new  
  end

  def index
    @students = Student.all.order('id desc')
  end

  def courses
    @student = Student.find(params[:student_id])
    @course_students = @student.course_students.includes(:teacher, :course, :lession_times)
    if current_user.teacher?
      @course_students = @course_students.where(teacher_id: current_user.id)
    end
  end

  def show
    params[:lession_status] ||= 'uncompleted'
    if ['uncompleted', "completed"].include?(params[:lession_status])
      @lessions = @student
        .lessions
        .order('start_at')
        .includes(:teacher, :course)
        .send(params[:lession_status])
      if current_user.teacher?
        @lessions = @lessions.where(teacher_id: current_user.id)
      end
    else
      @lessions = []
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

  def create
    @student = current_user.students.build(student_params)
    @student.init_password = @student.password
    respond_to do |format|
      if @student.save!
        format.html { redirect_to customer_service_students_path(current_user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

    def student_params
      params.require(:student).permit(
        :name, :email, :phone, :age, :gender, :avatar, :school, :school_type, :grade, :password, :init_password
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
  
end
