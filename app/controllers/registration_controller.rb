class RegistrationController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {token: user.token}, status: 201
    else
      render json: {error: 'Oops. Something went wrong.'}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end