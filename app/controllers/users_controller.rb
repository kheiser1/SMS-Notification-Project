class UsersController < ActionController::Base
def new
end

def create
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
     render 'welcome#index'
  else
    redirect_to '/signup'
  end
end
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end