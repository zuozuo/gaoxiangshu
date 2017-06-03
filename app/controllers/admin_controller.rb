class AdminController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to edit_admin_path(@admin), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
  end

  def create
  end

  def destory
  end

  private
    def admin_params
      params.require(:admin).permit(
        :name, :email, :phone, :age, :gender, :avatar, :school, :school_type, :grade, :password, :init_password
      )
    end
end
