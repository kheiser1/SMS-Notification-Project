class RemindersController < ApplicationController
    def new
    end
    
    def create
        @reminder = Reminder.new(reminder_params)
        @reminder.save
        redirect_to @reminder
    end
    
    def show
        @reminder = Reminder.find(params[:id])
    end
    
    def index
        @reminders = Reminder.all   
    end
    
    def edit
        @reminder = Reminder.find(params[:id])
    end
    
    def update
        @reminder = Reminder.find(params[:id])
        
        if @reminder.update(reminder_params)
            redirect_to @reminder
        else
            render 'edit'
        end
    end
end

private
def reminder_params
    params.require(:reminder).permit(:title, :date, :time, :notes)
end