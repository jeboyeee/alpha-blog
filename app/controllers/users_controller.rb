class UsersController < ApplicationController
  
  def new
    
  @user = User.new  
  
  end
  
  def create
  #type params to server terminal # Ctrl+d to stop
  #debugger 
  @user = User.new(user_params)
   if @user.save
    flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
    redirect_to articles_path
   else
    render 'new'
   end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end