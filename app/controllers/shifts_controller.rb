class ShiftsController < ApplicationController
  # before_action :authenticate_employee, except: [:index, :show]
  before_action :set_shift, only: [:show, :update, :destroy]
  # before_action :check_ownership, only: [:update, :destroy]

  # GET /shifts
  def index
    
    @shifts = []
    
    if (params[:username])
      Shift.find_by_employee(params[:username]).order("updated_at DESC").each do |shift|
        @shifts << shift.transform_shift
      end
    else
      Shift.order("created_at").each do |shift|  
        @shifts << shift.transform_shift
      end
    end    

    if @shifts.count == 0
      render json: {error: "Shifts not found"}
    else
      render json: @shifts
    end
  end

  def employee_shifts
    @shifts = []
    Shift.find_by_employee[:username].order("updated_at DESC").each do |shift|
      @shifts << shift.transform_shift
    end
    render json: @shifts
  end

  # GET /shifts/1
  def show
    if @shift
      render json: @shift.transform_shift
    else
      render json: {"Error": "Shift data not found: wrong id"}, status: :not_found
    end
  end

  # POST /shifts/new
  def new
    @shift = Shift.new
  end

  # POST /shifts
  def create
   @shift = Shift.create(shift_params)
    # @shift = current_employee.shifts.create(shift_params)
    if @shift.save
      render json: @shift.transform_shift, status: :created #, location: @shift
    else
      render json: @shift.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shifts/1
  def update
    if @shift.update(shift_params)
      render json: @shift.transform_shift
    else
      render json: @shift.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shifts/1
  def destroy
    @shift.destroy
  end

  private

    def check_ownership
      # Check if the current user is admin or owner of a shift
      # if !(current_employee.is_admin || current_employee.id == @shift.user.id)
      # if !current_employee.is_admin
        if current_employee.id != @shift.employee.id
          render json: {error: "You are not authorised to do this action"}
        end
      # end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shift_params
      params.permit(:shift, :date, :start, :finish, :password, :employee_id, :clocked_out)
    end
end
