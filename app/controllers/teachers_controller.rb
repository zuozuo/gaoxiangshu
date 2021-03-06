class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :students, :courses]

  layout 'teacher', only: [:show, :courses]

  def new
    @teacher = Teacher.new
  end

  def index
    @teachers = Teacher.all.order('id desc')
  end

  def students
    @students = @teacher.students
  end

  def courses
    @courses = @teacher.courses
  end

  def create
    @teacher = Teacher.new(teacher_params)

    @teacher.init_password = @teacher.password
    respond_to do |format|
      if @teacher.save!
        format.html { redirect_to teachers_path, notice: 'Customer service was successfully created.' }
        format.json { render :show, status: :created, location: @customer_service }
      else
        format.html { render :new }
        format.json { render json: @customer_service.errors, status: :unprocessable_entity }
      end
    end
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
        :name, :email, :phone, :age, :gender, :avatar, :school, :school_type, :grade, :time_zone, :time_difference, :password
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id] || params[:teacher_id])
    end
  
end
