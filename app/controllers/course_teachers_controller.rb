class CourseTeachersController < ApplicationController
  def create
    @ct = CourseTeacher.new({
      course_id: params[:course_id],
      teacher_id: params[:teacher_id]
    })

    respond_to do |format|
      if @ct.save!
        format.html do
          redirect_to courses_path, notice: 'Course Teacher was successfully created.'
        end
        format.js { render :create, status: :created }
      else
        format.html { render :new }
        format.js { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ct = CourseTeacher.find(params[:id])
    @ct.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.js { render :destroy, status: :created }
    end
  end
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_teacher_params
    params.permit(:name, :length)
  end
  
end
