class UsersController < ApplicationController
 

def new
end

def show
  @user=current_user
end
def create
  @user = User.new(user_params)
  numbers_only = @user.phone.chars.map {|x| x[/\d+/]}  
  @user.phone = "+1" + numbers_only.join("")
  if @user.save
    session[:user_id] = @user.id
    UserNotifierMailer.send_signup_email(@user).deliver
    redirect_to '/welcome/index'
  else
    @errors = @user.errors.full_messages
    render :action => 'new'
  end
end
def edit
        @user=current_user
end
def update
   @user = current_user
    if @user.update(user_params)
        render 'show'
    else
        render 'edit'
    end
end
def destroy
@user = current_user
@user.destroy
session[:id] = nil
redirect_to '/signup'

end

    def user_params
        params.require(:user).permit(:name, :email, :phone, :email_notifications, :phone_notifications, :password, :password_confirmation)
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