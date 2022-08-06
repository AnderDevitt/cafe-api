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
        @employee = Employee.new(employee_params)
        @employee.is_admin = "false"
        
        if @employee.save
            # These 2 lines are commented out as the employees do not gain access to the system when created by admin
            # auth_token = Knock::AuthToken.new payload: {sub: @employee.id}
            # render json: {username: @employee.username, jwt: auth_token.token}, status: :created

            # Return the new user's username when admin creates a new employee
            render json: {username: @employee.username}, status: :created
        else
            print @employee.errors.attribute_names
            # return an error message if the new user cannot be created in the database
            render json: {error: @employee.errors}, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /employees/1
    def update
        if @employee.update(employee_params)
            render json: @employee
        else
            render json: @employee.errors, status: :unprocessable_entity
        end
    end

    # DELETE /employee/1
    def destroy
        @employee.destroy
    end

    def login
        pp("Employee Login request received!")
        @employee = Employee.find_by_username(params[:username])
        if @employee && @employee.authenticate(params[:password])
            # Not sure this is correct, https://betterprogramming.pub/knock-as-an-authentication-solution-for-rails-api-acfaef5b25
            # auth_token = Knock::AuthToken.new payload: {sub: @employee.id}
            # render json: {username: @employee.username, jwt: auth_token.token}, status: 200
            render json: {Error: "Login successful", username: @employee.username}
        else
            render json: {Error: "Invalid username or password"}
        end
    end
    def sign_in
        @employee = Employee.find_by_username(params[:username])
        pp("Username provided is: " + params[:username])

        if @employee
            pp(@employee)
        end

        # if !@role.nil? && @role.authenticate(params[:password])
        if !@employee.nil? && BCrypt::Password.new(@employee.password) == params[:password]
            pp("Employee found!")
            auth_token = Knock::AuthToken.new(payload: {sub: @employee.id}).token 
            pp("Knock made an auth token: " + auth_token)
            render json: {username: @employee.username, jwt: auth_token}, status: 200
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
        params.permit(:username, :first_name, :last_name, :is_active, :password, :password_confirmation, :id, :email)
    end
end
