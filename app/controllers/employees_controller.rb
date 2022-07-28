class EmployeesController < ApplicationController
    def create
        @employee = Employee.create(employee_params)

        if @employee.errors.any?
            render json: @employee.errors, status: :unprocessable_entity
        else
            auth_token = Knock::AuthToken.new payload: {sub: @employee.id}
            render json: {username: @employee.username, jwt: auth_token.token}, status: :created
        end
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
    # Only allow a list of trusted parameters through.
    def employee_params
        params.permit(:username, :first_name, :last_name, :is_active, :password, :password_confirmation)
    end
end
