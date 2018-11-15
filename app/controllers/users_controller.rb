class UsersController < ActionController::Base
 

def new
end

def show
  @user=current_user
end
def create
  user = User.new(user_params)
  if user.save
    @user = user
    session[:user_id] = user.id
    UserNotifierMailer.send_signup_email(@user).deliver
    redirect_to '/welcome/index'
  else
    #render :action => 'new'
    redirect_to '/signup'
  end
end
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end


#class UsersController < ApplicationController
#  def create
    # Create the user from params
 #   @user = User.new(params[:user])
   # if @user.save
      # Deliver the signup email
   #   UserNotifier.send_signup_email(@user).deliver
   #   redirect_to(@user, :notice => 'User created')
  #  else
  #    render :action => 'new'
  #  end
 # end
#end