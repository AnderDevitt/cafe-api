class RolesController < ApplicationController

    def create
        @role = Role.new(role_params)

        if @role.errors.any?
            render json: @role.errors, status: :unprocessable_entity
        else
            render json: {username: @role.username}, status: :created
        end
    end

    def sign_in
        @role = Role.find_by_username(params[:username])
        pp("Username provided is: " + params[:username])

        if @role
            pp(@role)
        end

        # if !@role.nil? && @role.authenticate(params[:password])
        if !@role.nil? && BCrypt::Password.new(@role.password) == params[:password]
            pp("Role found!")
            # Not sure this is correct, https://betterprogramming.pub/knock-as-an-authentication-solution-for-rails-api-acfaef5b25
            auth_token = Knock::AuthToken.new(payload: {sub: @role.id}).token 
            pp("Knock made an auth token: " + auth_token)
            render json: {username: @role.username, jwt: auth_token}, status: 200
        else
            render json: {Error: "Invalid username or password"}
        end
    end

    private
    # Only allow a list of trusted parameters through.
    def role_params
        params.permit(:username, :email, :is_admin, :password, :password_confirmation)
    end

end
