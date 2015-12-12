class AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      render json: {token: user.token}, status: 200
    else
      render json: {error: 'Incorrect email or password.'}, status: 401
    end
  end

end