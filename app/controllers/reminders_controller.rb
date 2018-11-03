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
end
private
def reminder_params
    params.require(:reminder).permit(:title, :date, :time, :notes)
end