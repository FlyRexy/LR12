class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
  #current admin etc

  def user_signed_in?
    current_user.present?
  end

  def access
    return if user_signed_in?
    redirect_to root_path, :notice => 'You are not authorized'
  end

  def authorized
    return unless user_signed_in?
    redirect_to home_input_path, notice: 'You are already authorized'
  end

  helper_method :current_user, :user_signed_in?, :access
end
