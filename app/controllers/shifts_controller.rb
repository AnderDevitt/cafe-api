class ShiftsController < ApplicationController
  # before_action :authenticate_employee, except: [:index, :show]
  before_action :set_shift, only: [:show, :update, :destroy]
  before_action :check_ownership, only: [:update, :destroy]

  # GET /shifts
  def index
    # @shifts = Shift.all
    @shifts = []
    
      # Shift.each do |shift|
        # Shift.order("created_at").each do |shift|
          Shift.where("clocked_out" === false).order("created_at").each do |shift|  
        # if (shift.clocked_out === false)
          @shifts << shift.transform_shift
          # @shifts << shift
        
      end
    render json: @shifts
  end

  def shifts_current
    @shifts = []
          
    Shifts.where("clocked_out" === false).each do |shift|  
      @shifts << shift.transform_shift
    end
    if !@shifts.nil
      pp("Current shifts found")
      pp(@shifts)
      render json: @shifts
    else 
      render json: {Error: "No staff are currently working"}
    end
  end

  # GET /shifts/1
  def show
    if @shift
      render json: @shift.transform_shift
    else
      render json: {"Error": "Shift data not found: wrong id"}, status: :not_found
    end
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # POST /shifts
  def create
    
    # @current_employee = Employee.find_by_id(params[:employee_id])
    #     if @current_employee && @current_employee.authenticate(params[:password])
    #         auth_token = Knock::AuthToken.new payload: {sub: @current_employee.id}
    #         render json: {username: @current_employee.username, jwt: auth_token.token}, status: 200

            @shift = Shift.create(shift_params)
            if @shift.save
              render json: @shift, status: :created #, location: @shift
            else
              render json: @shift.errors, status: :unprocessable_entity
            end
        # else
            # render json: {Error: "Invalid username or password"}
        # end
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
      params.permit(:date, :start, :finish, :password, :employee_id, :clocked_out)
    end
end
