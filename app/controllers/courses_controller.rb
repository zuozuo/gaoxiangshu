class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    @teachers = Teacher.all.order('name').select(:id, :name)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @teachers = @course.teachers
  end

  def teachers
    @course = Course.find(params[:course_id])
    @teachers = @course.teachers.pluck(:name, :id)
    # lession_times = ActiveSupport::JSON.decode(params[:data])
    # teachers = []
    # lession_times.each do |lt|
    #   day, start_at, end_at = lt
    #   sql = %{SELECT `users`.`name`, `users`.`id` FROM `users` 
    #   INNER JOIN `course_teachers` as ct ON `users`.`id` = `ct`.`teacher_id`
    #   INNER JOIN `availible_times` as at ON `users`.`id` = `at`.`teacher_id`
    #   WHERE `users`.`type` IN ('Teacher')
    #   AND   `ct`.`course_id` = #{@course.id}
    #   AND   `at`.`start_at` <= '#{start_at}'
    #   AND   `at`.`end_at` >= '#{end_at}'
    #   AND   `at`.`day` = #{day};}
    #   ts = ActiveRecord::Base.connection.execute(sql)
    #   ts = ts.reject do |t|
    #     LessionTime.where(teacher_id: t.last).where(day: day).where(%{ ('#{start_at}' > start_at and '#{start_at}') < end_at OR ('#{end_at}' > start_at and '#{end_at}' < end_at) OR ('#{start_at}' < start_at and '#{end_at}' > start_at) }).present?
    #   end
    #   teachers << ts
    # end
    # @teachers = teachers.inject {|res, item| res & item}
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save!
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :length, :lession_count, :start_at, :end_at)
    end
end
