class ShiftsController < ApplicationController
  before_action :authenticate_employee, except: [:index, :show]
  before_action :set_shift, only: [:show, :update, :destroy]
  before_action :check_ownership, only: [:update, :destroy]

  # GET /shifts
  def index
    # @shifts = Shift.all
    @shifts = []
    Shift.order("created_at").each do |shift|
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

  # POST /shifts
  def create
    # @shift = Shift.new(shift_params)
    @shift = current_employee.shifts.create(shift_params)
    if @shift.save
      render json: @shift, status: :created #, location: @shift
    else
      render json: @shift.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shifts/1
  def update
    if @shift.update(shift_params)
      render json: @shift
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
      if current_employee.id != @shift.employee.id
        render json: {error: "You are not authorised to do this action"}
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shift_params
      params.permit(:date, :start, :finish)
    end
end
