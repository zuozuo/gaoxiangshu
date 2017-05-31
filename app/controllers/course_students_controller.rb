class CourseStudentsController < ApplicationController
  layout 'student'

  def index
    @student = Student.find(params[:student_id])
    redirect_to new_student_course_student_path(@student)
  end

  def new
    @student = Student.find(params[:student_id])
    @course_student = @student.course_students.build
    @teachers = []
  end

  def show
    @student = Student.find(params[:student_id])
    @course_student = CourseStudent.find(params[:id])
  end

  def create
    @student = Student.find(params[:student_id])
    @course_student = @student.course_students.new(course_student_params)

    respond_to do |format|
      if @course_student.save
        format.html do
          ltimes = ActiveSupport::JSON.decode(course_student_params[:ltimes])
          ltimes.map! do |lt|
            {
              day: lt.first,
              start_at: lt[1],
              end_at: lt[2],
              course_id: @course_student.course_id,
              course_student_id: @course_student.id,
              teacher_id: @course_student.teacher_id
            }
          end
          @student.lession_times.create! ltimes
          redirect_to [@student, @course_student], notice: 'College was successfully created.'
        end
        format.json { render :show, status: :created, location: @course_student }
      else
        format.html { render :new }
        format.json { render json: @course_student.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private

  def course_student_params
    params.require(:course_student).permit(
      :lession_times, :start_date, :total_lessions, :teacher_id, :course_id, :ltimes
    )
  end
end
