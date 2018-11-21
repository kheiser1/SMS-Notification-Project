class RemindersController < ApplicationController
require 'sendgrid-ruby'
require 'date'
require 'rubygems'
require 'twilio-ruby'
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
		        	"Time:" + @reminder.time.strftime("%l:%M %P") +  "\r\n\n" +
                    "Notes: " + @reminder.notes
            content = Content.new(type: 'text/plain', value: emailText)
            mail = Mail.new(from, subject, to, content)
            sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
            response = sg.client.mail._('send').post(request_body: mail.to_json)
            puts response.status_code
            puts response.body
            puts response.headers
   
            account_sid = 'AC1966847431bcba3f59f90a063f7ef099'
            auth_token = '452828480c126bb0adf02292a40c5abf'
            @client = Twilio::REST::Client.new(account_sid, auth_token)

            message = @client.messages.create(
                             from: '+13365609193',
                             body: 'Reminder for ' + @user.name + "\r\n\n" + 
            "Title: " + @reminder.title + "\r\n\n" + 
            "Notes: " + @reminder.notes + "\r\n\n" +
            "Date: " + @reminder.date.strftime("%b %d %Y") + "\r\n\n" + 
		    "Time:" + @reminder.time.strftime("%l:%M %P") +  "\r\n\n",
                             to: '+13367071124'
                           )

        puts message.sid
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
