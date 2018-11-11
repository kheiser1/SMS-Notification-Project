class WelcomeController < ApplicationController
  def index
    @user = current_user
    if @user 
      
    else 
      redirect_to '/login'
    end
  end
end
