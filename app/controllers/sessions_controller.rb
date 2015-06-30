class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Signed In"
      redirect_to home_index_path
    else
      render :new
      flash[:alert] = "Invalid email or password"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end
  

end