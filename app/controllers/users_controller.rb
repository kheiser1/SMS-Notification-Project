class UsersController < ActionController::Base
def new
end

def show
  @user=current_user
end
def create
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
    redirect_to '/welcome/index'
  else
    redirect_to '/signup'
  end
end
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end