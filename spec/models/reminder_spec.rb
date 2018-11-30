require 'rails_helper'
require 'date'
reminder_title = "Reminder Title"
reminder_date = DateTime.parse('2012-3-13')
reminder_time = reminder_date.to_time
reminder_notes = "Reminder Notes"
RSpec.describe  Reminder, type: :model do
	# before starting tests, create a test user
	before(:all) do
	user = User.create(name: "ryan", password: "password", phone:"+11234567", email: "ryan@me.com")
    reminder = Reminder.new(title: reminder_title, date: reminder_date, time: reminder_date, notes: reminder_notes) 
    reminder.user = user
    reminder.save!
    print reminder.time
    print reminder.date
    #User.create(username: "ry", password: "", phone:"+11234567", email: "ryan@me.com")
    end
  
    # set test data to the users we created above
    let(:valid_reminder) { Reminder.first }
	#let(:invalid_user) { User.last }

	describe "has" do
    	it "a title" do
          expect(valid_reminder.title).to eq reminder_title
		end
        
        it "a date" do
          expect(valid_reminder.date).to eq reminder_date
		end
        
        it "a time" do
          expect(valid_reminder.time).to eq reminder_date
		end
		it "notes" do
          expect(valid_reminder.notes).to eq reminder_notes
		end
	end
# 	 describe "validates" do
      
#       #	let(:reminder_with_no_title) {Reminder.new(date: "password", phone:"+11234567", email: "ryan@me.com")}
# 	    #let(:reminder_with_no_date) {Reminder.new(name: "ryan", password: "password", phone:"+11234567", email: "ryanmecom")}
# 		#let(:reminder_with_no_time){Reminder.new(name: "ryan", phone:"+11234567", email: "ryan@me.com")}
# 	#	let(:reminder_with_no_notes){Reminder.new(name: "ryan", phone:"+11234567", email: "ryan@me.com")}

#      #	it "the username" do
#           expect(user_with_bad_username).to_not be_valid
# 		end
        
#         it "the email" do
#           expect(user_with_bad_email).to_not be_valid
# 		end
# 		it "the password" do
#           expect(user_with_no_password).to_not be_valid
# 		end
   # end
end