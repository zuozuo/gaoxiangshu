class LessionsController < ApplicationController
  before_action :set_lession, only: [:show, :edit, :update, :destroy]
  
  def generate
    @student = Student.find(params[:student_id])
    if @student.lessions.empty?
      course_student = CourseStudent.find(params[:course_student_id])
      lession_times = course_student.lession_times.order("day")
      length = lession_times.length
      total = course_student.total_lessions
      count = 0
      (total/length + 1).times do |i|
        lession_times.each do |lt|
          if count < total
            diff = lt.start_at - lt.start_at.at_beginning_of_day
            duration = lt.end_at - lt.start_at
            date = course_student.start_date.beginning_of_week
            date = date + lt.day.to_i + i*7
            start_at = date + diff.seconds
            end_at = start_at + duration.seconds
            Lession.create!(
              day: lt.day,
              end_at: end_at,
              start_at: start_at,
              student_id: @student.id,
              course_id: course_student.course_id,
              teacher_id: course_student.teacher_id
            )
            count += 1
          end
        end
      end
    end
    redirect_to @student
  end

  # GET /lessions
  # GET /lessions.json
  def index
    @lessions = Lession.all
  end

  # GET /lessions/1
  # GET /lessions/1.json
  def show
  end

  # GET /lessions/new
  def new
    @lession = Lession.new
  end

  # GET /lessions/1/edit
  def edit
  end

  # POST /lessions
  # POST /lessions.json
  def create
    @lession = Lession.new(lession_params)

    respond_to do |format|
      if @lession.save
        format.html { redirect_to @lession, notice: 'Lession was successfully created.' }
        format.json { render :show, status: :created, location: @lession }
      else
        format.html { render :new }
        format.json { render json: @lession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessions/1
  # PATCH/PUT /lessions/1.json
  def update
    respond_to do |format|
      if @lession.update(lession_params)
        format.html { redirect_to @lession, notice: 'Lession was successfully updated.' }
        format.json { render :show, status: :ok, location: @lession }
      else
        format.html { render :edit }
        format.json { render json: @lession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessions/1
  # DELETE /lessions/1.json
  def destroy
    @lession.destroy
    respond_to do |format|
      format.html { redirect_to lessions_url, notice: 'Lession was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lession
      @lession = Lession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lession_params
      params.require(:lession).permit(:course_id, :student_id, :teacher_id, :start_at, :status)
    end
end
