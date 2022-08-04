class RolesController < ApplicationController

    def create
        @role = Role.create(role_params)

        if @role.errors.any?
            render json: @role.errors, status: :unprocessable_entity
        else
            # auth_token = Knock::AuthToken.new payload: {sub: @role.id}
            # render json: {username: @role.username, jwt: auth_token.token}, status: :created
            render json: {username: @role.username}, status: :created
        end
    end

    def sign_in
        @role = Role.find_by_username(params[:username])
        # if @role.present? && @role.password === params[:password]
        #     render json: {username: @role.username}, status: 200
        if @role && @role.authenticate(params[:password])
            # Not sure this is correct, https://betterprogramming.pub/knock-as-an-authentication-solution-for-rails-api-acfaef5b25
            # auth_token = Knock::AuthToken.new payload: {sub: @role.id}
            # render json: {username: @role.username, jwt: auth_token.token}, status: 200
            render json: {Error: "Login successful", username: @role.username}
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
