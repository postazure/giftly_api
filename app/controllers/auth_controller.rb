class AuthController < ApplicationController
  skip_before_action :authenticate_user

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      user.regenerate_token
      render json: {token: user.token}, status: 200
    else
      render json: {error: 'Incorrect email or password.'}, status: 401
    end
  end
end