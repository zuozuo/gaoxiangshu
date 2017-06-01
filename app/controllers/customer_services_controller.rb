class CustomerServicesController < ApplicationController
  before_action :set_customer_service, only: [:show, :edit, :update, :destroy, :students, :lessions]

  # GET /customer_services
  # GET /customer_services.json
  def index
    @customer_services = CustomerService.all
  end

  def students
    @students = @customer_service.students
  end

  def lessions
    @lessions = @customer_service.lessions#.upcomming
  end

  # GET /customer_services/1
  # GET /customer_services/1.json
  def show
  end

  # GET /customer_services/new
  def new
    @customer_service = CustomerService.new
  end

  # GET /customer_services/1/edit
  def edit
  end

  # POST /customer_services
  # POST /customer_services.json
  def create
    @customer_service = CustomerService.new(customer_service_params)

    respond_to do |format|
      if @customer_service.save
        format.html { redirect_to @customer_service, notice: 'Customer service was successfully created.' }
        format.json { render :show, status: :created, location: @customer_service }
      else
        format.html { render :new }
        format.json { render json: @customer_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_services/1
  # PATCH/PUT /customer_services/1.json
  def update
    respond_to do |format|
      if @customer_service.update(customer_service_params)
        format.html { redirect_to @customer_service, notice: 'Customer service was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_service }
      else
        format.html { render :edit }
        format.json { render json: @customer_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_services/1
  # DELETE /customer_services/1.json
  def destroy
    @customer_service.destroy
    respond_to do |format|
      format.html { redirect_to customer_services_url, notice: 'Customer service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_service
      @customer_service = CustomerService.find(params[:id] || params[:customer_service_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_service_params
      params.fetch(:customer_service, {})
    end
end
