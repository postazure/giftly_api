class ApplicationController < ActionController::Base
  require 'pp'
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  before_action :authenticate_user

  def authenticate_user
    if current_user.nil?
      render json: {error: 'Invalid User.'}, status: 401
    end
  end

  def current_user
    @user ||= User.find_by(token: token)
  end

  private

  def token
    request.headers["User-Token"]
  end
end
