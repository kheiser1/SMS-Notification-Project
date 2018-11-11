class RemindersController < ApplicationController
    
    def new
        @reminder = Reminder.new
        @user=current_user
    end
    
    def create
        @user=current_user
         @reminder = current_user.reminders.new(reminder_params)
        if @reminder.save
            redirect_to user_reminder_path(@user, @reminder)
        else
            render 'new'
        end
    end
    
    def show
        @user=current_user
        @reminder = Reminder.find(params[:id])
    end
    def index
       
        @reminders = current_user.reminders
        
        @user=current_user
    end
    
    def edit
        @user=current_user
        @reminder = Reminder.find(params[:id])
    end
    
    def update
        @user=current_user
        @reminder = Reminder.find(params[:id])
        
        if @reminder.update(reminder_params)
            redirect_to user_reminder_path(@user, @reminder)
        else
            render 'edit'
        end
    end
    
    def destroy
        @user=current_user
        @reminder = Reminder.find(params[:id])
        
        @reminder.destroy
        
        redirect_to user_reminders_path(@user)
    end
end

private
def reminder_params
    params.require(:reminder).permit(:title, :date, :time, :notes)
end
