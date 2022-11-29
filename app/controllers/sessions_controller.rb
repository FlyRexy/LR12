class SessionsController < ApplicationController
  before_action :access, only: :destroy
  before_action :authorized, only: %i[new create]
  def new

  end

  def create
    user = User.find_by_login(params[:login])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_input_path, :notice => "Welcome to the SEGMENTS again..."
    else
      redirect_to root_path, :notice => 'Wrong login or/and password'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path, :notice => 'Come again and get your segments!'
  end

end