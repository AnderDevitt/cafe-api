class RolesController < ApplicationController

    def create
        @role = Role.create(role_params)

        if @role.errors.any?
            render json: @role.errors, status: :unprocessable_entity
        else
            auth_token = Knock::AuthToken.new payload: {sub: @role.id}
            render json: {username: @role.username, jwt: auth_token.token}, status: :created
        end
    end

    def sign_in
        @role = Role.find_by_username(params[:username])
        if @role && @role.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @role.id}
            render json: {username: @role.username, jwt: auth_token.token}, status: 200
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