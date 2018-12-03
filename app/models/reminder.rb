class Reminder < ApplicationRecord
    belongs_to :user, :class_name => "User"
    validates :title, presence: true, length: { minimum: 5 }
    validates :date, presence: true
    validates :time, presence: true
    validates :notes, presence: true, length: { minimum: 10 } 
    after_create :remind
    def remind 
        @isTest=self.user.email=='test@test.com'
        if self.user.phone_notifications
        @twilio_number = '+13365609193'
        account_sid = @isTest ? ENV['TWILIO_TEST_SID'] : ENV['TWILIO_SID']
         @client = Twilio::REST::Client.new account_sid, @isTest ? ENV['TWILIO_TEST_TOKEN'] : ENV['TWILIO_TOKEN'] 
         time_str = ((self.time).localtime).strftime("%I:%M%p on %b. %d, %Y")
          reminder_body = 'Reminder for ' + self.user.name + "\r\n\n" + 
                "Title: " + self.title + "\r\n\n" + 
                "Notes: " + self.notes + "\r\n\n" +
                "Date: " + self.date.strftime("%b %d %Y") + "\r\n\n" + 
    		    "Time:" + self.time.strftime("%l:%M %P") +  "\r\n\n"
          message = @client.api.account(account_sid).messages.create(
                 :from => @twilio_number,
                 :to => self.user.phone,
                 :body => reminder_body
                     )
         end
               if self.user.email_notifications
                from = Email.new(email: 'test@example.com')
                to = Email.new(email: self.user.email)
                subject = 'Reminder for ' + self.user.name
                emailText = "Title: " + self.title + "\r\n\n" +
    			        "Date: " + self.date.strftime("%b %d %Y") + "\r\n\n" + 
    		        	"Time:" + self.time.strftime("%l:%M %P") +  "\r\n\n" +
                        "Notes: " + self.notes
                content = Content.new(type: 'text/plain', value: emailText)
                mail = Mail.new(from, subject, to, content)
                sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
                response = sg.client.mail._('send').post(request_body: mail.to_json)
            end
    end
    
    def when_to_run
         minutes_before_appointment = 5.minutes
         reminder_time = self.time
         reminder_time - minutes_before_appointment
    end
  handle_asynchronously :remind, :run_at => Proc.new { |i| i.when_to_run }
end
