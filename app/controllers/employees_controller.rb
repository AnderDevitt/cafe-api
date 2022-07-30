class EmployeesController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    # GET /employees
    def index
        # @employees = Employee.order("first_name")
        @employees = Employee.all
        render json: @employees
    end

    # GET /employees/1
    def show
        if @employee
            render json: @employee
        else
            render json: {"Error": "Employee not found, wrong id"}, status: :not_found
        end
    end

    def create
        @employee = Employee.create(employee_params)

        if @employee.errors.any?
            render json: @employee.errors, status: :unprocessable_entity
        else
            # auth_token = Knock::AuthToken.new payload: {sub: @employee.id}
            # render json: {username: @employee.username, jwt: auth_token.token}, status: :created
            render json: {username: @role.username}, status: :created
        end
    end

    # PATCH/PUT /employees/1
    def update
        if @employee.update(employee_params)
            render json: @employee
        else
            render json: @emplyee.errors, status: :unprocessable_entity
        end
    end

    # DELETE /employee/1
    def destroy
        @employee.destroy
    end

    def login
        @employee = Employee.find_by_username(params[:username])
        if @employee && @employee.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @employee.id}
            render json: {username: @employee.username, jwt: auth_token.token}, status: 200
        else
            render json: {Error: "Invalid username or password"}
        end

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
        @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
        params.permit(:username, :first_name, :last_name, :is_active, :password, :password_confirmation)
    end
end
