class RemindersController < ApplicationController
require 'sendgrid-ruby'
require 'date'
include SendGrid
    
    def new
        @reminder = Reminder.new
        @user=current_user
    end
    
    def create
        @user=current_user
        @reminder = current_user.reminders.new(reminder_params)
        if @reminder.save
            from = Email.new(email: 'test@example.com')
            to = Email.new(email: @user.email)
            subject = 'Reminder for ' + @user.name
            emailText = "Title: " + @reminder.title + "\r\n\n" +
			        "Date: " + @reminder.date.strftime("%b %d %Y") + "\r\n\n" + 
		        	"Time:" + @reminder.time.strftime("%H:%M") +  "\r\n\n" +
                    "Notes: " + @reminder.notes
            content = Content.new(type: 'text/plain', value: emailText)
            mail = Mail.new(from, subject, to, content)
            sg = SendGrid::API.new(api_key: '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')
            response = sg.client.mail._('send').post(request_body: mail.to_json)
            puts response.status_code
            puts response.body
            puts response.headers
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
